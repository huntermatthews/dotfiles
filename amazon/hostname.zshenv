## We reset the display hostname because we want the datacenter name when we're at work

export DISPLAY_HOSTNAME=$([ -f ~/.hostname_custom ] && cat ~/.hostname_custom || echo ${HOSTNAME%.amazon.com})

## END OF LINE ##
