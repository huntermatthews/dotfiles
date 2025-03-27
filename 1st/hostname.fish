## -*- mode: fish -*- ##

# FIXME: this should be a -U variable
set -gx DISPLAY_HOSTNAME=([ -f ~/.hostname_custom ] && cat ~/.hostname_custom || hostname -s)

## END OF LINE ##
