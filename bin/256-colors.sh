#!/bin/zsh

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.
#    print "\r\033[00;32mOK:\033[0m $@"

for fgbg in 38 48 ; do #Foreground/Background
    for color in {0..256} ; do #Colors
        #Display the color
        # The following _should_ all be equivalent
        #printf "\033[${fgbg};5;${color}m ${color}\t\033[0m"
        #echo -n "\033[${fgbg};5;${color}m ${color}\t\033[0m"
        echo -n "\e[${fgbg};5;${color}m ${color}\t\e[0m"
        #Display 10 colors per lines

        # Bash is ==. zsh is = or -eq
        if [ $((($color + 1) % 10)) = 0 ] ; then
            echo #New line
        fi
    done
    echo #New line
done

exit 0
