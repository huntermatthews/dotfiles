
# printenv does something stupid in some places - I forgot what or where
# Why is the output of neither printenv or env sorted by default?
alias printenv="/usr/bin/env  | sort"

# I prefer the old sort order -capitals at the top, then everything else. Mac/BSD goes this. Fake it
alias ll='LANG=C ls -lh'
alias la='LANG=C ls -lah'

# Remove commnets and whitespace only /blank lines from input (to be used in a pipeline)
alias nocomment="sed -e 's/#.*$//' -e '/^\s*$/d'"
alias wsstrip="sed -e 's/^[ \t]*//' -e 's/[ \t]*$//' -e 's/[ \t][ \t]*/ /'"

# Kerberos 4 has been obsolete for since 1993 <sigh>
alias klist='klist -5'
alias mkpasswd='mkpasswd -l 30 -c 5 -d 5 -C 5 -s 5'

# is your environment sudo heavy?
# alias fuck='sudo $(history \!\!)' is the bash equivalent.
alias fuck='sudo $(fc -ln -1)'

# web handy
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'


## END OF LINE ##
alias rfcdate='date +%FT%T%z'
