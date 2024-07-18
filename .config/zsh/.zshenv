export XDG_CONFIG_HOME=$HOME/.config
[[  -d $XDG_CONFIG_HOME ]] || mkdir -p $XDG_CONFIG_HOME

export XDG_CACHE_HOME=$HOME/Library/Caches
[[ -d $XDG_CACHE_HOME ]] || mkdir -p $XDG_CACHE_HOME

export XDG_DATA_HOME=$HOME/.local/share
[[ -d $XDG_DATA_HOME ]] || mkdir -p $XDG_DATA_HOME

export XDG_STATE_HOME=$HOME/.local/state
[[ -d $XDG_STATE_HOME ]] || mkdir -p $XDG_STATE_HOME

export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH="$XDG_DATA_HOME"/oh-my-zsh

[[ -d $XDG_STATE_HOME/zsh ]] || mkdir -p $XDG_STATE_HOME/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history

[[ -d $XDG_CACHE_HOME/less ]] || mkdir -p $XDG_CACHE_HOME/less
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

export NBRC_PATH="$XDG_CONFIG_HOME/nbrc"

export RBENV_ROOT="/opt/homebrew/rbenv"

export DOTFILES="$HOME"
export EDITOR="vim"
export GIT_EDITOR="vim"
export GIT_DUET_AUTHORS_FILE="$XDG_CONFIG_HOME/git/authors"
export BUNDLER_EDITOR="vim"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export NODE_PATH="/usr/local/lib/node"

export PATH=$DOTFILES/bin:$HOME/go/bin:$HOME/bin/Multimarkdown/bin:/usr/bin:/opt/homebrew/bin:opt/local/bin:/opt/local/sbin:/bin:/sbin:$PATH
export DEVSECRETS_PATH=/Volumes/PhelpsUnlimited128/DevSecrets

export GIT_CONFIG_NOSYSTEM=1
export PSQL_HISTORY="$XDG_DATA_HOME"/psql_history
