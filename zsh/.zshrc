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

source <(kubectl completion zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export LSCOLORS="ExFxBxDxCxegedabagacad"

# Take advantage of $LS_COLORS for completion as well.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# zsh settings
COMPLETION_WAITING_DOTS="true"

# Source local/private files
[ -f "${HOME}/.secrets" ] && source "${HOME}/.secrets"
[ -f "${HOME}/.zshrc-local" ] && source "${HOME}/.zshrc-local"

# Path
export PATH="$HOME/bin:$PATH"
