export XDG_CONFIG_HOME=$HOME/.config
[[  -d $XDG_CONFIG_HOME ]] || mkdir -p $XDG_CONFIG_HOME

export XDG_CACHE_HOME=$HOME/Library/Caches
[[ -d $XDG_CACHE_HOME ]] || mkdir -p $XDG_CACHE_HOME

export XDG_DATA_HOME=$HOME/.local/share
[[ -d $XDG_DATA_HOME ]] || mkdir -p $XDG_DATA_HOME

export XDG_STATE_HOME=$HOME/.local/state
[[ -d $XDG_STATE_HOME ]] || mkdir -p $XDG_STATE_HOME

[[ -f $XDG_DATA_HOME/config.sh.local ]] && source $XDG_DATA_HOME/config.sh.local

export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH="$XDG_CONFIG_HOME/zsh/ohmyzsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/ohmyzsh"
export ZSH_CUSTOM=$XDG_CONFIG_HOME/zsh/customization

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

export PATH=/opt/homebrew/bin:/usr/local/bin:$DOTFILES/bin:$HOME/go/bin:$HOME/bin/Multimarkdown/bin:/usr/bin:/opt/local/bin:/opt/local/sbin:/bin:/sbin:./bin:$PATH
export DEVSECRETS_PATH=/Volumes/PhelpsUnlimited128/DevSecrets

export HOMEBREW_PREFIX=$(brew --prefix)
export PATH="$HOMEBREW_PREFIX/share/git-core/contrib/diff-highlight:$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/mysql/bin:$HOMEBREW_PREFIX/share/npm/bin:$PATH"


export GIT_CONFIG_NOSYSTEM=1
export PSQL_HISTORY="$XDG_DATA_HOME"/psql_history

source "$XDG_CONFIG_HOME/zsh/ruby.env"
source "$XDG_CONFIG_HOME/zsh/node.env"
source "$XDG_CONFIG_HOME/zsh/aws.env"
source "$XDG_CONFIG_HOME/zsh/asdf.env"
