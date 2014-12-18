# -*- mode: sh -*-

if ! is_amazon || is_mac ; then
    return
fi

## PATH INSANITY
#Adding SE Tools to $PATH
path+=(/apollo/bin)
path+=(/apollo/env/SDETools/bin)
path+=(/apollo/env/envImprovement/bin)
path+=(/apollo/env/GlacierOpsTools/bin)


## END OF LINE ##
