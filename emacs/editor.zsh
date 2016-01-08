export EDITOR=e
export VISUAL=$EDITOR

[ -f ~/.localrc ] && source ~/.localrc

# I know this occluds /usr/bin/view - thats vim, Im an emacs weenie
view() { e --eval "(view-file \"$1\")" }

# I keep doing this lately
alias emacs='echo Dont run emacs directly - use e instead'

## END OF LINE ##
