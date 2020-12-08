export XDG_CONFIG_HOME=$HOME/.config
if [ ! -d $XDG_CONFIG_HOME ]
then
mkdir -p $XDG_CONFIG_HOME
fi

export XDG_CACHE_HOME=$HOME/Library/Caches
if [ ! -d $XDG_CACHE_HOME ]
then
mkdir -p $XDG_CACHE_HOME
fi

export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export RBENV_ROOT="/usr/local/rbenv"

export DOTFILES="$HOME"
export EDITOR='vim'
export GIT_EDITOR='vim'
export BUNDLER_EDITOR='vim'
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export NODE_PATH="/usr/local/lib/node"

export PATH="$HOME/.nodenv/bin:$PATH"
# Delete after Chicago engagement
export PATH="$PATH:$HOME/Library/Python/3.7/bin"
export PATH=$DOTFILES/bin:$HOME/go/bin:$HOME/bin/Multimarkdown/bin:$HOME/bin/abbot/bin:/usr/bin:opt/local/bin:/opt/local/sbin:/bin:/sbin:$PATH
export DEVSECRETS_PATH=/Volumes/PhelpsUnlimited128/DevSecrets

export GIT_CONFIG_NOSYSTEM=1

source "$DOTFILES/.config/zsh/ruby.env"
