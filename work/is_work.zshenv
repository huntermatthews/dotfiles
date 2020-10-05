# -*- mode: sh -*-


# its a double negative because I want to have to mark all non-prod hosts
# a host not marked is ASSUMED to be prod, the only SAFE assumption.
# BUG: zprompt is using this and I can't be bothered to fix it right now...
is_prod() { [[ ! -f ~/.dotfiles_host_not_prod ]] }

if ! is_work ; then
   return
fi

EMAIL="hunter.matthews@nih.gov"
export EMAIL

## END OF LINE ##
