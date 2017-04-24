
# From https://discuss.atom.io/t/it-would-be-nice-to-be-able-to-pipe-standard-out-to-atom-and-have-it-open-in-an-unsaved-document/4781/16
# command-with-output | atom-pipe
function atom-pipe {
  ATOM_TEMP=$(mktemp /tmp/atom.XXXX)
  cat > $ATOM_TEMP
  atom --wait $ATOM_TEMP
  rm $ATOM_TEMP
}

alias atom='atom -n'

export EDITOR='code --wait'
