# http://askubuntu.com/questions/233280/gnome-terminal-reports-term-to-be-xterm
if [ "x$TERM" == "xxterm" ]
then
    export TERM=xterm-256color
fi

RESET="\[\033[0m\]"  # unsets color to term's fg color

# regular colors
BLACK="\[\033[0;30m\]"  # black
RED="\[\033[0;31m\]"  # red
GREEN="\[\033[0;32m\]"  # green
BROWN="\[\033[0;33m\]"  # yellow
BLUE="\[\033[0;34m\]"  # blue
PURPLE="\[\033[0;35m\]"  # magenta
CYAN="\[\033[0;36m\]"  # cyan
LIGHT_GRAY="\[\033[0;37m\]"  # off white

# emphasized (bolded) colors
DARK_GRAY="\[\033[1;30m\]" # dark black
LIGHT_RED="\[\033[1;31m\]" # orange
LIGHT_GREEN="\[\033[1;32m\]" # light gray
YELLOW="\[\033[1;33m\]" # light gray
LIGHT_BLUE="\[\033[1;34m\]" # light gray
LIGHT_PURPLE="\[\033[1;35m\]" # purple
LIGHT_CYAN="\[\033[1;36m\]" # light gray
WHITE="\[\033[1;37m\]" #white

# background colors
BGK="\[\033[40m\]"
BGR="\[\033[41m\]"
BGG="\[\033[42m\]"
BGY="\[\033[43m\]"
BGB="\[\033[44m\]"
BGM="\[\033[45m\]"
BGC="\[\033[46m\]"
BGW="\[\033[47m\]"

# https://wiki.archlinux.org/index.php/Color_Bash_Prompt
#return value visualisation
#PS1="\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[0;32m\];)\"; else echo \"\[\033[0;31m\];(\"; fi)\[\033[00m\] : "

case $TERM in
  xterm*|rxvt*)
    TITLE_BAR='\[\e]0;\u@\h: \w\a\]'
    ;;
  *)
    TITLE_BAR=""
    ;;
esac

user_check() {
  local UC=$W     # user's color
  [ $UID -eq "0" ] && UC=$R # root's color
}

# https://gist.github.com/henrik/31631
function parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

prompt_for_dark() {
  PS1="${TITLE_BAR}${BROWN}\t ${LIGHT_GREEN}\u ${BLUE}\h ${CYAN}\w ${PURPLE}\$(parse_git_branch)\n${LIGHT_GREEN}\$ ${RESET}"
}

plain_prompt() {
  PS1="\u \h \w \$ "
}

simple_prompt() {
  PS1="\$ "
}

prompt_for_dark
