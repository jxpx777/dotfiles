# This file must be used with "source bin/activate.csh" *from csh*.
# You cannot run it directly.

alias kerl_deactivate 'test $?_KERL_SAVED_PATH != 0 && setenv PATH "$_KERL_SAVED_PATH" && unset _KERL_SAVED_PATH; rehash; test $?_KERL_SAVED_MANPATH != 0 && setenv MANPATH "$_KERL_SAVED_MANPATH" && unset _KERL_SAVED_MANPATH; test $?_KERL_SAVED_REBAR_PLT_DIR != 0 && setenv REBAR_PLT_DIR "$_KERL_SAVED_REBAR_PLT_DIR" && unset _KERL_SAVED_REBAR_PLT_DIR; test $?_KERL_ACTIVE_DIR != 0 && unset _KERL_ACTIVE_DIR; test $?_KERL_DOCSH_USER_DEFAULT != 0 && unsetenv DOCSH_USER_DEFAULT && unset _KERL_DOCSH_USER_DEFAULT; test $?_KERL_ERL_CALL_REMOVABLE != 0 && unset _KERL_ERL_CALL_REMOVABLE; test $?_KERL_DOCSH_DOT_ERLANG != 0 && rm "$HOME/.erlang" && unset _KERL_DOCSH_DOT_ERLANG; test $?_KERL_SAVED_PROMPT != 0 && set prompt="$_KERL_SAVED_PROMPT" && unset _KERL_SAVED_PROMPT; test "!:*" != "nondestructive" && unalias deactivate'

# Unset irrelevant variables.
kerl_deactivate nondestructive

if ( $?REBAR_PLT_DIR ) then
    set _KERL_SAVED_REBAR_PLT_DIR = "$REBAR_PLT_DIR"
else
    set _KERL_SAVED_REBAR_PLT_DIR=""
endif

set _KERL_PATH_REMOVABLE = "/Users/jp/.asdf/installs/erlang/25.0.3/bin"
set _KERL_SAVED_PATH = "$PATH"
setenv PATH "${_KERL_PATH_REMOVABLE}:$PATH"

if ( ! $?MANPATH ) then
    set MANPATH = ""
endif
set _KERL_MANPATH_REMOVABLE = "/Users/jp/.asdf/installs/erlang/25.0.3/lib/erlang/man:/Users/jp/.asdf/installs/erlang/25.0.3/man"
set _KERL_SAVED_MANPATH = "$MANPATH"
setenv MANPATH "${_KERL_MANPATH_REMOVABLE}:$MANPATH"

setenv REBAR_PLT_DIR "/Users/jp/.asdf/installs/erlang/25.0.3"

set _KERL_ACTIVE_DIR = "/Users/jp/.asdf/installs/erlang/25.0.3"

set _KERL_ERL_CALL_REMOVABLE = /Users/jp/.asdf/installs/erlang/25.0.3/lib/erl_interface-5.3/bin
setenv PATH "${_KERL_ERL_CALL_REMOVABLE}:$PATH"

if ( -f "/Users/jp/.asdf/plugins/erlang/kerl-home/.kerlrc.csh" ) then
    source "/Users/jp/.asdf/plugins/erlang/kerl-home/.kerlrc.csh"
endif

if ( $?KERL_ENABLE_PROMPT ) then
    set _KERL_SAVED_PROMPT = "$prompt"

    if ( $?KERL_PROMPT_FORMAT ) then
        set FRMT = "$KERL_PROMPT_FORMAT"
    else
        set FRMT = "(%BUILDNAME%)"
    endif

    set PROMPT = $(echo "$FRMT" | sed 's^%RELEASE%^25.0.3^;s^%BUILDNAME%^asdf_25.0.3^')
    set prompt = "$PROMPT$prompt"
endif

if ( -d "/Users/jp/.asdf/installs/erlang/25.0.3/lib/docsh" ) then
    setenv DOCSH_USER_DEFAULT "/Users/jp/.asdf/installs/erlang/25.0.3/lib/docsh/user_default"
    set _KERL_DOCSH_USER_DEFAULT = "yes"
    if ( -f "$HOME/.erlang" ) then
        if ( $?KERL_DOCSH_DOT_ERLANG == 0 ) then
            echo "Couldn't symlink correct $HOME/.erlang - file exists - docsh might not work."
            echo "Please make sure $HOME/.erlang contains code"
            echo "from /Users/jp/.asdf/installs/erlang/25.0.3/lib/docsh/dot.erlang"
            echo "and export KERL_DOCSH_DOT_ERLANG=exists to suppress this warning."
        endif
    else
        ln -s "/Users/jp/.asdf/installs/erlang/25.0.3/lib/docsh/dot.erlang" "$HOME/.erlang"
        set _KERL_DOCSH_DOT_ERLANG = "yes"
    endif
endif

rehash
