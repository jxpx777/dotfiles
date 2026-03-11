export PATH=/opt/homebrew/bin:/usr/local/bin:$DOTFILES/bin:$GOPATH/bin:$HOME/bin/Multimarkdown/bin:/usr/bin:/opt/local/bin:/opt/local/sbin:/bin:/sbin:./bin:$PATH
export PATH="$RBENV_ROOT/shims:$HOMEBREW_PREFIX/share/git-core/contrib/diff-highlight:$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/mysql/bin:$HOMEBREW_PREFIX/share/npm/bin:$PATH"
export PATH="$PATH:$HOME/fvm/default/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

[[ -x "$BREW" ]] && eval "$("$BREW" shellenv)"
