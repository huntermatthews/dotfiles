#-*- mode: sh -*-

if ! is_amazon || is_mac ; then
    return 
fi

#Configuration needed by perforce to function correctly in any directory 
#export P4CONFIG=.p4config

#Make SDETools use a simplified directory structure for organizing source code.  
export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short

# Hostclass aliases
alias ehc="eh --hosts-only"
alias eh="caching-expand-hostclass --recurse"

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

# @graydonp: for region in iad dub fra sfo pdx nrt syd bjs pdt; do alias "$region"aux='ssh $( ehc glacier-prod-aux-'$region' | head -1)'; done
aux() { ssh $(ehc glacier-prod-aux-$1 | tail -1) }

## END OF LINE ##
