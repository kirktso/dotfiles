# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Load the oh-my-zsh's library
zplug "lib/history", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh, as:plugin
zplug "plugins/autojump", from:oh-my-zsh, as:plugin
zplug "plugins/colored-man-pages", from:oh-my-zsh, as:plugin

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"

zplug "supercrabtree/k"

zplug "~/.dotfiles/zsh-files", from:local

# Pure prompt
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

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

export EDITOR='code --wait'

# Completion
source <(kubectl completion zsh)
zstyle ':completion:*' menu select
# Take advantage of $LS_COLORS for completion as well.
export LS_COLORS="di=1;34:ln=1;35:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

#export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export LSCOLORS="ExFxBxDxCxegedabagacad"

# Source local/private files
[ -f "${HOME}/.secrets" ] && source "${HOME}/.secrets"
[ -f "${HOME}/.zshrc-local" ] && source "${HOME}/.zshrc-local"

# Path
export PATH="$HOME/bin:$PATH"
