###########################
# ALIASES
###########################
## Finger memory says its md5sum
alias md5sum 'md5 -r'

# make unfortunately is installed as gmake.
# I think it can just be an alias and we're fine -- 2025-03-28
alias make gmake


alias diff 'diff -u'

# Show the thing I want anyways
alias forks "fork status"

# I prefer the old sort order -capitals at the top, then everything else. Mac/BSD goes this. Fake it
alias ll 'LANG=C ls -lhH'
alias la 'LANG=C ls -lahH'

alias nless "less -N"

alias rfcdate 'date +%FT%T%z'

# printenv does something stupid in some places - I forgot what or where
# Why is the output of neither printenv or env sorted by default?
alias printenv "/usr/bin/env | sort"

# Remove comments and whitespace only /blank lines from input (to be used in a pipeline)
# alias nocomment 'sed -e "s/#.*\$//" -e "/^\s*\$/d"'
# alias wsstrip 'sed -e "s/^[ \t]*//" -e "s/[ \t]*\$//" -e "s/[ \t][ \t]*/ /"'

# Create a randomized password good enough to actually use.
alias pwgen 'pwgen --secure 30 1'

# this formats shell scripts (bash / zsh) "correctly"
# fish uses fish_indent.
alias shfmt 'shfmt -i 4 -bn -ci -sr'

# terraform is too much to spell
alias tf $HOME/code/cloud/ssa-terraform/bin/ssa-terraform

alias tsize 'echo $LINES x $COLUMNS'

alias vs 'code --new-window '
alias ee vs
