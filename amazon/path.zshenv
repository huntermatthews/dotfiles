# -*- mode: sh -*-

# Maybe should put this in its own file, but whatever
is_amazon() { [[ ${HOSTNAME%amazon.com} != ${HOSTNAME} ]] }  # yes, NOT equal
# Should we have a "has_apollo" or "is_apollo" ??

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
