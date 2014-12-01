# -*- mode: sh -*-

# Maybe should put this in its own file, but whatever
is_amazon() { [[ ${HOSTNAME%amazon.com} != ${HOSTNAME} ]] }  # yes, NOT equal

if ! is_amazon ; then
    return
fi

## PATH INSANITY
#Adding SE Tools to $PATH
path+=(/apollo/bin)
path+=(/apollo/env/SDETools/bin)
path+=(/apollo/env/envImprovement/bin)
path+=(/apollo/env/GlacierOpsTools/bin)


## END OF LINE ##
