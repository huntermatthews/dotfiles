## -*- mode: fish -*- ##

# in zsh HOST is set but not HOSTNAME (linux sometimes gets it anyway, not sure from where)
if [[ -z $HOSTNAME ]] ; then 
    export HOSTNAME=$HOST
fi

export DISPLAY_HOSTNAME=$([ -f ~/.hostname_custom ] && cat ~/.hostname_custom || hostname -s)

## END OF LINE ##
