export EDITOR=e
export VISUAL=$EDITOR

source ~/.localrc

# I know this occluds /usr/bin/view - thats vim, Im an emacs weenie
view() { e --eval "(view-file \"$1\")" }

## END OF LINE ##
