# -*- mode: sh -*-

if ! is_work ; then
    return
fi

## PATH INSANITY
#Force a few more equal pigs - dont ask.
path+=(/apollo/bin)
path+=(/apollo/env/SDETools/bin)
path+=(/apollo/env/envImprovement/bin)
path+=(/apollo/env/GlacierOpsTools/bin)

# For macs and non-desktop boxen, we have to probe.
#for dir in /apollo/env/*/bin ; do [ -d $dir ] && path+=($dir) ;done

## END OF LINE ##
