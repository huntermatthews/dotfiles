## -*- mode: fish -*- ##

# printenv does something stupid in some places - I forgot what or where
# Why is the output of neither printenv or env sorted by default?
alias printenv "/usr/bin/env | sort"

# I prefer the old sort order -capitals at the top, then everything else. Mac/BSD goes this. Fake it
alias ll 'LANG=C ls -lhH'
alias la 'LANG=C ls -lahH'

# Remove comments and whitespace only /blank lines from input (to be used in a pipeline)
# @fish-lsp-disable-next-line
alias nocomment 'sed -e "s/#.*\$//" -e "/^\s*\$/d"'
alias wsstrip 'sed -e "s/^[ \t]*//" -e "s/[ \t]*\$//" -e "s/[ \t][ \t]*/ /"'

# Create a randomized password good enough to actually use.
alias pwgen 'pwgen --secure 30 1'

alias rfcdate 'date +%FT%T%z'
alias diff 'diff -u'

alias tsize 'echo $LINES x $COLUMNS'

# this formats shell scripts "correctly"
alias shfmt 'shfmt -i 4 -bn -ci -sr'

# terraform is too much to spell
alias tf $HOME/projects/terraform/bin/ssa-terraform

# colorized less
function cless
    echo "Nope"
end

alias nless "less -N"

# Need a command name for all time thats editor independent.
alias edit cot

# TODO : convert to abbr ???
#brew info --json cf-terraforming globstar gotz hishtory immich-go kapp kirimase org-formation ov pivy punktf rattler-index semver sequoia-sqv sttr tml yoke ytt | jq -r '.[] | "####",.name,.desc,.homepage,"\n"'

## END OF LINE ##
