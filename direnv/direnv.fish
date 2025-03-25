# -*- mode: fish -*-

# Don't do anything if direnv isn't installed...
# remember, we aren't in source context, we're in one big config file context...
if command -v direnv &>/dev/null
    direnv hook fish | source
end

# END OF LINE #
