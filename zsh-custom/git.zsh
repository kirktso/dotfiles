# export GIT_EDITOR=atom -w -n

alias gpullall='find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'

eval "$(hub alias -s)"
