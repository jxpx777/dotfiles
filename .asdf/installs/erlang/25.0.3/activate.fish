# credits to virtualenv
function _kerl_remove_el --description 'remove element from array'
    set -l new_array
    for el in $$argv[1]
        if test $el != $argv[2]
            set new_array $new_array $el
        end
    end
    set -x $argv[1] $new_array
end

function kerl_deactivate --description "deactivate erlang environment"
    if set --query _KERL_PATH_REMOVABLE
        _kerl_remove_el PATH "$_KERL_PATH_REMOVABLE"
        set --erase _KERL_PATH_REMOVABLE
    end
    if set --query _KERL_MANPATH_REMOVABLE
        _kerl_remove_el MANPATH "$_KERL_MANPATH_REMOVABLE"
        set --erase _KERL_MANPATH_REMOVABLE
    end
    if set --query _KERL_SAVED_REBAR_PLT_DIR
        set -x REBAR_PLT_DIR "$_KERL_SAVED_REBAR_PLT_DIR"
        set --erase _KERL_SAVED_REBAR_PLT_DIR
    end
    if set --query _KERL_ACTIVE_DIR
        set --erase _KERL_ACTIVE_DIR
    end
    if functions --query _kerl_saved_prompt
        functions --erase fish_prompt
        # functions --copy complains about about fish_prompt already being defined
        # so we take a page from virtualenv's book
        . ( begin
                printf "function fish_prompt\n\t#"
                functions _kerl_saved_prompt
            end | psub )
        functions --erase _kerl_saved_prompt
    end
    if set --query _KERL_DOCSH_DOT_ERLANG
        rm "$HOME/.erlang"
        set --erase _KERL_DOCSH_DOT_ERLANG
    end
    if set --query _KERL_DOCSH_USER_DEFAULT
        set --erase DOCSH_USER_DEFAULT
        set --erase _KERL_DOCSH_USER_DEFAULT
    end
    if set --query _KERL_ERL_CALL_REMOVABLE
        _kerl_remove_el PATH "$_KERL_ERL_CALL_REMOVABLE"
        set --erase _KERL_ERL_CALL_REMOVABLE
    end
    if test "$argv[1]" != "nondestructive"
        functions --erase kerl_deactivate
        functions --erase _kerl_remove_el
    end
end
kerl_deactivate nondestructive

set -x _KERL_SAVED_REBAR_PLT_DIR "$REBAR_PLT_DIR"
set -x _KERL_PATH_REMOVABLE "/Users/jp/.asdf/installs/erlang/25.0.3/bin"
set -x PATH "$_KERL_PATH_REMOVABLE" $PATH
set -x _KERL_MANPATH_REMOVABLE "/Users/jp/.asdf/installs/erlang/25.0.3/lib/erlang/man" "/Users/jp/.asdf/installs/erlang/25.0.3/man"
set -x MANPATH $MANPATH "$_KERL_MANPATH_REMOVABLE"
set -x REBAR_PLT_DIR "/Users/jp/.asdf/installs/erlang/25.0.3"
set -x _KERL_ACTIVE_DIR "/Users/jp/.asdf/installs/erlang/25.0.3"
set -x _KERL_ERL_CALL_REMOVABLE (\find "/Users/jp/.asdf/installs/erlang/25.0.3" -type d -path "*erl_interface*/bin")
set -x PATH "$_KERL_ERL_CALL_REMOVABLE" $PATH

if test -f "/Users/jp/.asdf/plugins/erlang/kerl-home/.kerlrc.fish"
    source "/Users/jp/.asdf/plugins/erlang/kerl-home/.kerlrc.fish"
end
if set --query KERL_ENABLE_PROMPT
    functions --copy fish_prompt _kerl_saved_prompt
    function fish_prompt
        echo -n "(asdf_25.0.3)"
        _kerl_saved_prompt
    end
end
if test -d "/Users/jp/.asdf/installs/erlang/25.0.3/lib/docsh"
    set -x DOCSH_USER_DEFAULT "/Users/jp/.asdf/installs/erlang/25.0.3/lib/docsh/user_default"
    set -x _KERL_DOCSH_USER_DEFAULT yes
    if test -f "$HOME/.erlang"
        if test ! x"$KERL_DOCSH_DOT_ERLANG" = x"exists"
            echo "Couldn't symlink correct $HOME/.erlang - file exists - docsh might not work."
            echo "Please make sure $HOME/.erlang contains code"
            echo "from /Users/jp/.asdf/installs/erlang/25.0.3/lib/docsh/dot.erlang"
            echo "and export KERL_DOCSH_DOT_ERLANG=exists to suppress this warning."
        end
    else
        ln -s "/Users/jp/.asdf/installs/erlang/25.0.3/lib/docsh/dot.erlang" "$HOME/.erlang"
        set -x _KERL_DOCSH_DOT_ERLANG yes
    end
end
