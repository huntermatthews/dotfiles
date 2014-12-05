#-*- mode: sh -*-

if [[ ${HOSTNAME%amazon.com} == ${HOSTNAME} ]] ; then  # cant use =~ at work, zsh too old
    # if that test matches then we are _NOT_ at work - and should skip this file
    return 
fi

#Configuration needed by perforce to function correctly in any directory 
#export P4CONFIG=.p4config

#Make SDETools use a simplified directory structure for organizing source code.  
export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short

# Hostclass aliases
alias ehc="expand-hostclass --recurse --hosts-only"
alias eh="expand-hostclass --recurse"

# server-attributes
# I _know_ this occluds the system sa in /usr/sbin/sa  -- useless to me at amazon
alias sa='server-attributes -H  -a HostName AssetId HardwareId ServerTypeId InstalledOsId'
alias sac='sa | column -t'

# Brazil Aliases
alias brazil-tpt="/apollo/env/BrazilThirdPartyTool/bin/brazil-third-party-tool"

# Apollo Aliases
alias our='/apollo/bin/env -e GlacierOpsTools'

# Gets rid of needing an amazon specific dot file everywhere.
alias post-review='post-review --note --target-groups=Glacier'

alias remote-command='remote-command --recurse 999 --batch --override-ping /bin/true --text-output'

# Should make these generic
PAGER=less
READNULLCMD=less

## END OF LINE ##
