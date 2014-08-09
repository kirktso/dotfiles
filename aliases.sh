alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias la='ls -A'
alias ll='ls -lahF'
alias vi='vim'

alias gs='git status -sb'
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias b='bundle'
alias be='bundle exec'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Rails
alias tl='tail -f log/development.log'
alias rs="if [ -f script/server ]; then script/server; else script/rails server; fi"
alias rc="if [ -f script/console ]; then script/console; else script/rails console; fi"

# useful command to find what you should be aliasing:
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

alias ..='cd ..;' # can then do .. .. .. to move up multiple directories.
alias ...='.. ..'

alias ip="curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'"
alias localip="ipconfig getifaddr en1"
alias ll='tree --dirsfirst -ChFupDaLg 1'

# alias `simplehttpd` to start a simple webserver in the current director
alias simplehttpd='python -m SimpleHTTPServer 8888';

# misc
alias reload='. ~/.bash_profile'

# for tmux
# from: http://www.unwiredcouch.com/2013/11/15/my-tmux-setup.html
alias tma='tmux attach -d -t'
alias tmit='tmux new -s $(basename $(pwd))'
