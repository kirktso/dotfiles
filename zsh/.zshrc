# zsh settings
COMPLETION_WAITING_DOTS="true"

export SPACESHIP_TIME_SHOW=true
export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_EXIT_CODE_SHOW=true
export SPACESHIP_KUBECONTEXT_SHOW=false
export SPACESHIP_BATTERY_SHOW=false
# This is for spaceship theme and disabling the right side vim 
# mode indictor. Must be done before oh-my-zsh.sh.
export RPS1="%{$reset_color%}"

source /usr/local/share/antigen/antigen.zsh
antigen init .antigenrc

# Path
export PATH="$HOME/bin:$PATH"

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete

[ -f "${HOME}/.secrets" ] && source "${HOME}/.secrets"

# added by travis gem
[ -f /Users/kirk/.travis/travis.sh ] && source /Users/kirk/.travis/travis.sh
