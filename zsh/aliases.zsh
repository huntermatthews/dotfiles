# Prevents aliases on the command line from being internally substituted before completion is attempted. The effect is to make the alias a distinct command for completion purposes.
setopt complete_aliases

# printenv does something stupid in some places - I forgot what or where
# Why is the output of neither printenv or env sorted by default?
alias printenv="/usr/bin/env  | sort"

# I prefer the old sort order -capitals at the top, then everything else. Mac/BSD goes this. Fake it
alias ll='LANG=C ls -lhH'
alias la='LANG=C ls -lahH'

# Remove commnets and whitespace only /blank lines from input (to be used in a pipeline)
alias nocomment="sed -e 's/#.*$//' -e '/^\s*$/d'"
alias wsstrip="sed -e 's/^[ \t]*//' -e 's/[ \t]*$//' -e 's/[ \t][ \t]*/ /'"

alias mkpasswd='mkpasswd -l 30 -c 5 -d 5 -C 5 -s 5'
alias pwgen='pwgen --secure 30 1'

alias rfcdate='date +%FT%T%z'
alias diff='diff -u'

alias tsize='echo $LINES x $COLUMNS'

# this formats shell scripts "correctly"
alias shfmt='shfmt -i 4 -bn -ci -sr'

# terraform is too much to spell
alias tf=$HOME/projects/terraform/bin/ssa-terraform

# colorized less
cless() {
    pygmentize $@ | less
}

alias lessn="less -N"

# Need a command name for all time thats editor independant.
alias edit=cot

## END OF LINE ##
