# Disable flow control so <C-s> works in vim
stty -ixon
if [[ $TERM == xterm ]]; then
	TERM=xterm-256color
fi

export ZSH_CUSTOM=$XDG_CONFIG_HOME/zsh/customization


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Base16 Shell
BASE16_SHELL="$XDG_CONFIG_HOME/iTerm/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

PROJECT_PATHS=(~/Projects ~/code)
# Example aliases
# alias zshconfig="$EDITOR ~/.zshrc"
# alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=1
export DISABLE_UPDATE_PROMPT=true

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler colorize gem git golang gpg-agent redis-cli sudo taskwarrior tmux urltools)
plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source "$XDG_CONFIG_HOME/zsh/aliases"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

export FZF_DEFAULT_COMMAND="ag -g ''"
source $XDG_CONFIG_HOME/zsh/customization/base16-tomorrow.fzf.config


source "$XDG_CONFIG_HOME"/zsh/gnupg.env
gpgconf --launch gpg-agent
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

test -e "${XDG_CONFIG_HOME}/iTerm/shell_integration" && source "${XDG_CONFIG_HOME}/iTerm/shell_integration"
iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch --no-color 2> /dev/null) | grep \* | cut -c3-)
}

function killport () {
	lsof -i :$1 | tail -n1 | awk '{print $2}' | xargs kill
}

iterm2_print_user_vars

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export FZF_DEFAULT_COMMAND="ag -g ''"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GPG_TTY=$(tty)

[ -f "$XDG_CONFIG_HOME/terraform/zsh.comp" ] && source "$XDG_CONFIG_HOME/terraform/zsh.comp"
source "$XDG_CONFIG_HOME/zsh/ruby.env"
source "$XDG_CONFIG_HOME/zsh/node.env"
source "$XDG_CONFIG_HOME/zsh/aws.env"
source "$XDG_CONFIG_HOME/zsh/asdf.env"

[ -f ~/.local/share/github/github.zsh ] && source ~/.local/share/github/github.zsh
