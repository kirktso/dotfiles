#!/bin/bash

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

info () {
  printf "  [ \033[00;34m..\033[0m ] $1 \n"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 \n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

link() {
  ln -sfn $SCRIPTDIR/$1 $HOME/.$1
  e_success "Linked: $HOME/.$1"
}

e_header "Process dotfiles"

for DOTFILE in `find . -maxdepth 1 -not -name '.*' -not  -name "install.sh" -not -name "README.md"`
do
  link `basename $DOTFILE`
done

source ~/.bash_profile

