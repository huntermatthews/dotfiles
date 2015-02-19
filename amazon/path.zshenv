# -*- mode: sh -*-

if ! is_amazon ; then
    return
fi

## PATH INSANITY
#Adding SE Tools to $PATH
#path+=(/apollo/bin)
#path+=(/apollo/env/SDETools/bin)
#path+=(/apollo/env/envImprovement/bin)
#path+=(/apollo/env/GlacierOpsTools/bin)

# For macs and non-desktop boxen, we have to probe.
for dir in /apollo/bin /apollo/env/*/bin ; do [ -d $dir ] && path+=($dir) ;done

## END OF LINE ##
