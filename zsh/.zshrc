bindkey -v

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

zplug "~/.dotfiles/zsh-files", from:local

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export EDITOR='code --wait'

# Completion
zstyle ':completion:*' menu select
# Take advantage of $LS_COLORS for completion as well.
export LS_COLORS="di=1;34:ln=1;35:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

export LSCOLORS="ExFxBxDxCxegedabagacad"

# Source local/private files
[ -f "${HOME}/.secrets" ] && source "${HOME}/.secrets"
[ -f "${HOME}/.zshrc-local" ] && source "${HOME}/.zshrc-local"

# Path
export PATH="$HOME/bin:$PATH"

source /Users/kirk/.dotfiles/zsh-files/man-pages.zsh

eval "$(starship init zsh)"
