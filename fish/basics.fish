## -*- mode: fish -*- ##

set -gx LESS RiX
set -gx PAGER less

set -gx EDITOR "cot -n -w"
set -gx LSCOLORS ExGxFxDxCxDxDxHbaDaCec

# Get our dotfiles bin directory into the path
fish_add_path --global --move --path $DOTS/bin

# Get rid of the regular startup message
set fish_greeting ""

## END OF LINE ##
