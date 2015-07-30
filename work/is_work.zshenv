# -*- mode: sh -*-


is_work() { [[ ${HOSTNAME%facebook.com} != ${HOSTNAME} ]] }  # yes, NOT equal

if ! is_work ; then
   return
fi

## We reset the display hostname because we want the datacenter name when we're at work
#export DISPLAY_HOSTNAME=$([ -f ~/.hostname_custom ] && cat ~/.hostname_custom || echo ${HOSTNAME%.facebook.com})

EMAIL="thm@fb.com"
export EMAIL

## END OF LINE ##
