
# printenv does something stupid in some places - I forgot what or where
# Why is the output of neither printenv or env sorted by default?
alias printenv="/usr/bin/env  | sort"

# I prefer the old sort order -capitals at the top, then everything else. Mac/BSD goes this. Fake it
alias ll='LANG=C ls -lh'

# Remove commnets and whitespace only /blank lines from input (to be used in a pipeline)
alias nocomment="sed -e 's/#.*$//' -e '/^\s*$/d'"

## END OF LINE ##
