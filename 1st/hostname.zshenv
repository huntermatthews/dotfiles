# -*- mode: sh -*-

function hostname_custom {
    [ -f ~/.hostname_custom ] && cat ~/.hostname_custom || hostname -s 
}

# on osx HOST is set but not HOSTNAME
if [[ -z $HOSTNAME ]] ; then 
    export HOSTNAME=$HOST
fi

export HOSTNAME_CUSTOM=$(hostname_custom)
export ZSH_THEME_TERM_TITLE_IDLE="%n@$HOSTNAME_CUSTOM: %~"

## END OF LINE ##
