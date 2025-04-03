## -*- mode: fish -*- ##

# printenv does something stupid in some places - I forgot what or where
# Why is the output of neither printenv or env sorted by default?
alias printenv "/usr/bin/env | sort"

# I prefer the old sort order -capitals at the top, then everything else. Mac/BSD goes this. Fake it
alias ll 'LANG=C ls -lhH'
alias la 'LANG=C ls -lahH'

# Remove comments and whitespace only /blank lines from input (to be used in a pipeline)
# alias nocomment 'sed -e "s/#.*\$//" -e "/^\s*\$/d"'
# alias wsstrip 'sed -e "s/^[ \t]*//" -e "s/[ \t]*\$//" -e "s/[ \t][ \t]*/ /"'

# Create a randomized password good enough to actually use.
alias pwgen 'pwgen --secure 30 1'

alias rfcdate 'date +%FT%T%z'
alias diff 'diff -u'

alias tsize 'echo $LINES x $COLUMNS'

# this formats shell scripts (bash / zsh) "correctly"
# fish uses fish_indent.
alias shfmt 'shfmt -i 4 -bn -ci -sr'

# terraform is too much to spell
alias tf $HOME/projects/terraform/bin/ssa-terraform

# colorized less
function cless
    echo Nope
end

alias nless "less -N"

## END OF LINE ##
