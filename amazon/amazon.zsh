#-*- mode: sh -*-

if [[ ${HOSTNAME%amazon.com} != ${HOSTNAME} ]] ; then  # cant use =~ at work, zsh too old
# the test is backwards (if the strings are different we ARE at work)
# Love to have another way out of this 

## PATH INSANITY
#Adding SE Tools to $PATH
path[1,0]=/apollo/bin
path[1,0]=/apollo/env/SDETools/bin
path[1,0]=/apollo/env/envImprovement/bin
path[1,0]=/apollo/env/GlacierOpsTools/bin
path[1,0]=

#Configuration needed by perforce to function correctly in any directory 
#export P4CONFIG=.p4config

#Make SDETools use a simplified directory structure for organizing source code.  
export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short

# Hostclass aliases
alias ehc="expand-hostclass --recurse --hosts-only"
alias eh="expand-hostclass --recurse"

# Brazil Aliases
alias brazil-tpt="/apollo/env/BrazilThirdPartyTool/bin/brazil-third-party-tool"

# Apollo Aliases
alias our='/apollo/bin/env -e GlacierOpsTools'

# Should make these generic
PAGER=less
READNULLCMD=less

fi ## if at work

## END OF LINE ##
