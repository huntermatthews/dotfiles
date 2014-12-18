# -*- mode: sh -*-

## We reset the display hostname because we want the datacenter name when we're at work

# Maybe should put this in its own file, but whatever
is_amazon() { [[ ${HOSTNAME%amazon.com} != ${HOSTNAME} ]] }  # yes, NOT equal

if ! is_amazon ; then
   return
fi


export DISPLAY_HOSTNAME=$([ -f ~/.hostname_custom ] && cat ~/.hostname_custom || echo ${HOSTNAME%.amazon.com})

## END OF LINE ##
