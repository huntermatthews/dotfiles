# -*- mode: sh -*-

brew-about () {
           open -g $(brew info $1 | sed -n '2p')
}

## END OF LINE ##
