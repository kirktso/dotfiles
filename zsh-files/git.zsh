alias gpullall='find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;'
alias groot='git rev-parse --show-toplevel'

# https://gist.github.com/igrigorik/6666860#gistcomment-1465440
# alias gh="open `git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#http://#' -e 's@com:@com/@'`| head -n1"

eval "$(hub alias -s)"
