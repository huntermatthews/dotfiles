# -*- mode: sh -*-

if ! is_work ; then
   return
fi

EMAIL="hunter.matthews@nih.gov"
export EMAIL

# its a double negative because I want to have to mark all non-prod hosts
# a host not marked is ASSUMED to be prod, the only SAFE assumption.
is_prod() { [[ ! -f ~/.dotfiles_host_not_prod ]] }

## END OF LINE ##
