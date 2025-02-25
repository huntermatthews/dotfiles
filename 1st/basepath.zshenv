# -*- mode: sh -*-

#
# No one can consistently and reliably set the damn path. So I do it myself.
#

dotfiles_debug "HOME = ${HOME}"

## NEW STYLE ZSH PATH MADNESS
typeset -U path      # force the array to only have unique values (no more tests everywhere!)
path=()   # empty things out
path=(
$HOME/bin
/usr/bin
/bin
/usr/sbin
/sbin
/usr/local/bin
)

dotfiles_debug "basepath path == ${path}"
## END OF LINE ##

