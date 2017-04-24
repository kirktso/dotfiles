# zsh settings
COMPLETION_WAITING_DOTS="true"

# Antigen
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load custom zsh scripts from oh-my-zsh
# antigen bundle $HOME/dotfiles/oh-my-zsh/custom
# TODO Move these to the dotfile repo
antigen bundle $HOME/.dotfiles/zsh-custom --no-local-clone

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle urltools
antigen bundle git
antigen bundle osx
antigen bundle docker
antigen bundle vi-mode
antigen bundle autojump
antigen bundle history
antigen bundle colored-man-pages

# Not sure if this works with antigen or not
antigen bundle zsh_reload

# Bundles from anywhere else
antigen bundle supercrabtree/k

# Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="flazz"
#ZSH_THEME="skaro"
#ZSH_THEME="spaceship"
#ZSH_THEME="agnoster"
# Fav - ZSH_THEME="junkfood"
# nice one - miloshadzic
#ZSH_THEME="sporty_256"

# Spaceship Theme
# https://github.com/denysdovhan/spaceship-zsh-theme
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
SPACESHIP_TIME_SHOW=true
SPACESHIP_DOCKER_SHOW=false
# This is for spaceship theme and disabling the right side vim 
# mode indictor. Must be done before oh-my-zsh.sh.
export RPS1="%{$reset_color%}"

# Syntax highlighting bundle
# !!!! This must be last bundle sourced
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen apply

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete

export PATH="$HOME/bin:$PATH"
