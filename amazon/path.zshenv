# -*- mode: sh -*-

if [[ ${HOSTNAME%amazon.com} == ${HOSTNAME} ]] ; then  # cant use =~ at work, zsh too old
    # If the tests passes then we are NOT at work and should skip this file
    return 
fi

## PATH INSANITY
#Adding SE Tools to $PATH
path+=(/apollo/bin)
path+=(/apollo/env/SDETools/bin)
path+=(/apollo/env/envImprovement/bin)
path+=(/apollo/env/GlacierOpsTools/bin)


## END OF LINE ##
