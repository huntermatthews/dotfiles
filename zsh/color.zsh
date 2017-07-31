# Anything to do with color should go here.
# ls, grep, the prompt, whatever.
# Except a bunch of the prompt stuff is elsewhere....

## MOST IMPORTANT PART OF THE FILE
autoload colors; colors;

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  if [[ "$(uname -s)" == "NetBSD" ]]; then
    # On NetBSD, test if "gls" (GNU ls) is installed (this one supports colors);
    # otherwise, leave ls as is, because NetBSD's ls doesn't support -G
    gls --color -d . &>/dev/null 2>&1 && alias ls='gls --color=tty'
  elif [[ "$(uname -s)" == "OpenBSD" ]]; then
    # On OpenBSD, test if "colorls" is installed (this one supports colors);
    # otherwise, leave ls as is, because OpenBSD's ls doesn't support -G
    colorls -G -d . &>/dev/null 2>&1 && alias ls='colorls -G'
  else
    ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

    # This was set by translating the default colors on rhel5 linux (which I kinda like)
    #  to the mac LSCOLORS equivalent (or something close).
    export LSCOLORS=ExGxFxDxCxDxDxHbaDaCec
  fi
fi

## END OF LINE ##


