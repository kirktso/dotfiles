alias dot-edit="code -n ~/.dotfiles"
alias ls='ls -FG'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias la='ls -A'
alias ll='ls -lahF'
alias vi='vim'

# Git
alias g="git"

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# useful command to find what you should be aliasing:
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

#alias ..='cd ..;' # can then do .. .. .. to move up multiple directories.
#alias ...='.. ..'

alias ip="curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'"
alias localip="ipconfig getifaddr en1"
alias ll='tree --dirsfirst -ChFupDaLg 1'

# alias `simplehttpd` to start a simple webserver in the current director
alias simplehttpd='python -m SimpleHTTPServer 8888';

# for tmux
# from: http://www.unwiredcouch.com/2013/11/15/my-tmux-setup.html
alias tma='tmux attach -d -t'
alias tmit='tmux new -s $(basename $(pwd))'

######

alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"
alias paths='echo -e ${PATH//:/\\n}'

# Network

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

alias psgrep="psgrep -i"

alias hs='history | grep "${1}"'
alias json="python -m json.tool"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
  export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
  colorflag="-G"
  export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# From: https://github.com/alexrochas/dotfiles/blob/master/home/.zsh/aliases.zsh
alias infinite='function _while(){while true; do eval "$1"; done;};_while'
alias lg='git-explorer explore --light'
alias dev='cd ~/Development'
