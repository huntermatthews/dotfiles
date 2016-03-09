# from zshuery or something


is_mac() { [[ $OSTYPE == darwin* ]] }
is_freebsd() { [[ $OSTYPE == freebsd* ]] }
is_linux() { [[ $OSTYPE == linux* ]] }

# its a double negative because I want to have to mark all non-prod hosts
# a host not marked is ASSUMED to be prod, the only SAFE assumption.
is_prod() { [[ ! -f ~/.dotfiles_host_not_prod ]] }

## END OF LINE ##
