# -*- mode: sh -*-

if [[ ${HOSTNAME%amazon.com} != ${HOSTNAME} ]] ; then  # cant use =~ at work, zsh too old
# the test is backwards (if the strings are different we ARE at work)
# Love to have another way out of this 

## PATH INSANITY
#Adding SE Tools to $PATH
path+=(/apollo/bin)
path+=(/apollo/env/SDETools/bin)
path+=(/apollo/env/envImprovement/bin)
path+=(/apollo/env/GlacierOpsTools/bin)

fi  # end of hostname check

## END OF LINE ##
