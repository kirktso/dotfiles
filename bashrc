# HISTORY Settings
export HISTCONTROL=ignoredups:ignorespace
export HISTCONTROL=erasedups
export HISTSIZE=1000
export HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export EDITOR=vi
set -o vi

# BSD specific way to add color to ls
export CLICOLOR="true"
export LSCOLORS=GxFxCxDxBxegedabagaced 

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# set PATH so it includes /usr/local
if [ -d "/usr/local/bin" ] ; then
    PATH="/usr/local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


# Less Colors for Man Pages
# from: http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# make `man` use use `less` for paging and not clear the screen upon exit
export MANPAGER='less -X';

# rb-env
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Options for less
export LESS="-R"

for file in ~/.{bash_prompt2.sh,aliases.sh,functions.sh,localrc.sh,secrets.sh}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Homebrew installed autojump
[[ -s /usr/local/etc/autojump.sh ]] && . /usr/local/etc/autojump.sh

# Homebrew installed shell tab completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

