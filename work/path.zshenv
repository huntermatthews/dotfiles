# -*- mode: sh -*-

if is_mac ; then

    ## PATH INSANITY
    #Force a few more equal pigs - dont ask.
    # on osx
    path+=(/opt/facebook/bin)
    path+=(/usr/local/munki)
    path+=(~/fb/devtools/arcanist/bin)

fi

if is_work && is_linux ; then

    # on linux (at least my dev machine)
    path+=(/usr/local/sbin)
    path+=(/usr/facebook/ops/scripts)
    path+=(/usr/facebook/scripts)
    path+=(/opt/local/bin)

fi


#for dir in /apollo/env/*/bin ; do [ -d $dir ] && path+=($dir) ;done

## END OF LINE ##
