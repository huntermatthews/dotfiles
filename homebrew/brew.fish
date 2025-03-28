## -*- mode: fish -*- ##

eval (/opt/homebrew/bin/brew shellenv)

# TODO: I think this should be an abbrev
function brew-about
    open -g (brew info --json make | jq .[0].homepage)
end

## END OF LINE ##
