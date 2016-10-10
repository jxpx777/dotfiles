%%
%% %CopyrightBegin%
%% 
%% Copyright Ericsson AB 2007-2022. All Rights Reserved.
%% 
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%% 
%% %CopyrightEnd%
%%

%%
%%----------------------------------------------------------------------
%% Purpose: Handles ssl sessions
%%----------------------------------------------------------------------

-module(ssl_session).

-include("ssl_handshake.hrl").
-include("ssl_internal.hrl").
-include("ssl_api.hrl").

%% Internal application API
-export([is_new/2, client_select_session/5, server_select_session/5, valid_session/2, legacy_session_id/0]).

-type seconds()   :: integer(). 

%%--------------------------------------------------------------------
-spec legacy_session_id() -> ssl:session_id().
%%
%% Description: TLS-1.3 deprecates the session id but has a dummy
%% value for it for protocol backwards-compatibility reasons.
%% If now lower versions are configured this function can be called
%% for a dummy value.
%%--------------------------------------------------------------------
legacy_session_id() ->
    crypto:strong_rand_bytes(32).

%%--------------------------------------------------------------------
-spec is_new(ssl:session_id(), ssl:session_id()) -> boolean().
%%
%% Description: Checks if the session id decided by the server is a
%%              new or resumed sesion id.
%%--------------------------------------------------------------------
is_new(<<>>, _) ->
    true;
is_new(SessionId, SessionId) ->
    false;
is_new(_ClientSuggestion, _ServerDecision) ->
    true.

%%--------------------------------------------------------------------
-spec client_select_session({ssl:host(), inet:port_number(), map()}, db_handle(), atom(),
                            #session{}, list()) -> #session{}.
%%
%% Description: Should be called by the client side to get an id
%%              for the client hello message.
%%--------------------------------------------------------------------
client_select_session({_, _, #{versions := Versions,
                               protocol := Protocol}} = ClientInfo, 
                      Cache, CacheCb, NewSession, CertKeyPairs) ->
    
    RecordCb = record_cb(Protocol),
    Version = RecordCb:lowest_protocol_version(Versions),
    
    case Version of
        {3, N} when N >= 4 ->
          NewSession#session{session_id = legacy_session_id()};
        _ ->
            do_client_select_session(ClientInfo, Cache, CacheCb, NewSession, CertKeyPairs)
    end.  

%%--------------------------------------------------------------------
-spec server_select_session(ssl_record:ssl_version(), pid(), binary(), map(),
                            list())  -> {binary(), #session{} | undefined}.
%%
%% Description: Should be called by the server side to get an id
%%              for the client hello message.
%%--------------------------------------------------------------------
server_select_session(_, SessIdTracker, <<>>, _SslOpts, _CertKeyPairs) ->
    {ssl_server_session_cache:new_session_id(SessIdTracker), undefined};
server_select_session(_, SessIdTracker, SuggestedId, Options, CertKeyPairs) ->
    case is_resumable(SuggestedId, SessIdTracker, Options, CertKeyPairs)
    of
	{true, Resumed} ->
	    {SuggestedId, Resumed};
	{false, undefined} ->
            Id = ssl_server_session_cache:new_session_id(SessIdTracker),
            {Id, undefined}
    end.

-spec valid_session(#session{}, seconds() | {invalidate_before, integer()}) -> boolean().
%%
%% Description: Check that the session has not expired
%%--------------------------------------------------------------------
valid_session(#session{time_stamp = TimeStamp}, {invalidate_before, Before}) ->
    TimeStamp > Before;
valid_session(#session{time_stamp = TimeStamp}, LifeTime) ->
    Now = erlang:monotonic_time(),
    Lived = erlang:convert_time_unit(Now-TimeStamp, native, seconds),
    Lived < LifeTime.
%%--------------------------------------------------------------------
%%% Internal functions
%%--------------------------------------------------------------------
do_client_select_session({_, _, #{reuse_session := {SessionId, SessionData}}}, _, _, NewSession, _) when is_binary(SessionId) andalso
                                                                                                         is_binary(SessionData) ->
    try binary_to_term(SessionData, [safe]) of
        Session ->
            Session
    catch
        _:_ ->
            NewSession#session{session_id = <<>>}
    end;
do_client_select_session({Host, Port, #{reuse_session := SessionId}}, Cache, CacheCb, NewSession, _) when is_binary(SessionId)->
    case CacheCb:lookup(Cache, {{Host, Port}, SessionId}) of
        undefined ->
	    NewSession#session{session_id = <<>>};
	#session{} = Session->
	    Session
    end;
do_client_select_session(ClientInfo, Cache, CacheCb, NewSession, CertKeyPairs) ->
    case select_session(ClientInfo, Cache, CacheCb, CertKeyPairs) of
        no_session ->
            NewSession#session{session_id = <<>>};
        Session ->
            Session
    end.

select_session({_, _, #{reuse_sessions := Reuse}}, _Cache, _CacheCb, _) when Reuse =/= true ->
    %% If reuse_sessions == false | save a new session should be created
    no_session;
select_session({HostIP, Port, SslOpts}, Cache, CacheCb, CertKeyPairs) ->
    Sessions = CacheCb:select_session(Cache, {HostIP, Port}),
    select_session(Sessions, SslOpts, CertKeyPairs).

select_session([], _, _) ->
    no_session;
select_session(Sessions, #{ciphers := Ciphers}, CertKeyPairs) ->
    IsNotResumable =
	fun(Session) ->
                SessionOwnCert =
                    case Session#session.own_certificates of
                        [OwnCert |_] ->
                            OwnCert;
                        Other ->
                            Other
                    end,
		not (resumable(Session#session.is_resumable) andalso
		     lists:member(Session#session.cipher_suite, Ciphers)
		     andalso (is_owncert(SessionOwnCert, CertKeyPairs) orelse (SessionOwnCert == undefined)))
 	end,
    case lists:dropwhile(IsNotResumable, Sessions) of
	[] ->   no_session;
	[Session | _] -> Session
    end.

is_resumable(_, _, #{reuse_sessions := false}, _) ->
    {false, undefined};
is_resumable(SuggestedSessionId, SessIdTracker, #{reuse_session := ReuseFun} = Options, OwnCertKeyPairs) ->
    case ssl_server_session_cache:reuse_session(SessIdTracker, SuggestedSessionId) of
	#session{cipher_suite = CipherSuite,
                 own_certificates =  [SessionOwnCert | _],
		 compression_method = Compression,
		 is_resumable = IsResumable,
		 peer_certificate = PeerCert} = Session ->
	    case resumable(IsResumable)
		andalso is_owncert(SessionOwnCert, OwnCertKeyPairs)
		andalso reusable_options(Options, Session)
		andalso ReuseFun(SuggestedSessionId, PeerCert,
				 Compression, CipherSuite)
	    of
		true  -> {true, Session};
		false -> {false, undefined}
	    end;
	not_reusable ->
 	    {false, undefined}
    end.

is_owncert(_, []) ->
    false;
is_owncert(SessionOwnCert, [#{certs := [SessionOwnCert | _]} | _]) ->
    true;
is_owncert(SessionOwnCert, [_| Rest]) ->
    is_owncert(SessionOwnCert, Rest).

resumable(new) ->
    false;
resumable(IsResumable) ->
    IsResumable.

reusable_options(#{fail_if_no_peer_cert := true,
                   verify := verify_peer}, Session) ->
    (Session#session.peer_certificate =/= undefined);
reusable_options(_,_) ->
    true.

record_cb(tls) ->
    tls_record;
record_cb(dtls) ->
    dtls_record.
