#! /usr/bin/env bash
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Brew/homebrew is a mac only thing - don't run this on linux
if [ "$(uname -s)" == "Darwin" ]
then

    # Install brew itself
    if test ! $(which brew) ; then
        echo "installing brew"
        ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" > /tmp/brew-install.log
    fi

    # install (or update) all the things we get from Brew
    brew bundle Brewfile

fi

exit 0
