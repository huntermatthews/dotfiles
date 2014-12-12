# 
# No one can consistently and reliably set the damn path. So I do it myself.
#

## NEW STYLE ZSH PATH MADNESS
typeset -U path      # force the array to only have unique values (no more tests everywhere!)
path=()   # empty things out
path=(
$HOME/bin
/usr/local/bin
/usr/bin
/bin
/usr/sbin
/sbin
)

## END OF LINE ##

