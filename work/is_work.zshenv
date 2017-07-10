# -*- mode: sh -*-


is_work() { [[ ${HOSTNAME%nih.gov} != ${HOSTNAME} ]] }  # yes, NOT equal

if ! is_work ; then
   return
fi

EMAIL="hunter.matthews@nih.gov"
export EMAIL

## END OF LINE ##
