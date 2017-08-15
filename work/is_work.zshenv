# -*- mode: sh -*-


is_work() { [[ ${HOSTNAME} == *'nih.gov' ]] } 

if ! is_work ; then
   return
fi

EMAIL="hunter.matthews@nih.gov"
export EMAIL

## END OF LINE ##
