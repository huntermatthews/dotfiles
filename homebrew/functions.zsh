# -*- mode: sh -*-

brew-about () {
           open -g $(brew info $1 | sed -n '3p')
}

## END OF LINE ##
