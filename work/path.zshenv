# -*- mode: sh -*-

if ! is_work ; then
    return
fi

## PATH INSANITY
#Force a few more equal pigs - dont ask.
# on osx
path+=(/opt/facebook/bin)
path+=(/usr/local/munki)

# on linux (at least my dev machine)
path+=(/usr/local/sbin)
path+=(/usr/facebook/ops/scripts)
path+=(/usr/facebook/scripts)
path+=(/opt/local/bin)

# For macs and non-desktop boxen, we have to probe.
#for dir in /apollo/env/*/bin ; do [ -d $dir ] && path+=($dir) ;done

## END OF LINE ##
