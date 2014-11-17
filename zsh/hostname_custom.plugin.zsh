# -*- mode: sh -*-

function hostname_custom {
    [ -f ~/.hostname_custom ] && cat ~/.hostname_custom || hostname -s 
}

export HOSTNAME_CUSTOM=$(hostname_custom)
export ZSH_THEME_TERM_TITLE_IDLE="%n@$HOSTNAME_CUSTOM: %~"

## END OF LINE ##
