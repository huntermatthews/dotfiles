#-*- mode: sh -*-

if [[ ${HOSTNAME%amazon.com} != ${HOSTNAME} ]] ; then  # cant use =~ at work, zsh too old
# the test is backwards (if the strings are different we ARE at work)
# Love to have another way out of this

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

# Gets rid of needing an amazon specific dot file everywhere.
alias post-review='post-review --note --target-groups=Glacier'

# Should make these generic
PAGER=less
READNULLCMD=less

fi ## if at work

## END OF LINE ##
