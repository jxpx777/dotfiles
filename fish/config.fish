set GOPATH $HOME/go
set PATH ./bin /usr/local/share/git-core/contrib/diff-highlight /usr/local/bin /usr/local/sbin /usr/sbin /usr/local/mysql/bin /usr/local/share/npm/bin $GOPATH/bin $PATH
set PATH $PATH /usr/local/opt/go/libexec/bin
if status --is-interactive
	source $HOME/.config/base16-shell/profile_helper.fish
	eval sh $HOME/.config/base16-shell/scripts/base16-tomorrow.sh
end
