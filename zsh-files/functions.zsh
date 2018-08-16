# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@"
}


function viw() {
  file "$(which "$1")"
  ls -ld "$(which "$1")"
}

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* *
  fi
}

# Create a data URL from a file
function dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@"
}

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* *
  fi
}

# Create a data URL from a file
function dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Add bundler binstubs to path securely
# From: https://github.com/sstephenson/rbenv/wiki/Understanding-binstubs
function binstubs() {
  export PATH="$PWD/bin:$PATH"
  hash -r 2>/dev/null || true
}

# Saw in a railscast, which lead to this:
# http://www.stefanoforenza.com/how-to-repeat-a-shell-command-n-times/
# repeat() {
#     n=$1
#     shift
#     while [ $(( n -= 1 )) -ge 0 ]
#     do
#         "$@"
#     done
# }
