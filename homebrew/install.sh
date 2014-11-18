#! /usr/bin/env zsh
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Brew/homebrew is a mac only thing - don't run this elsewhere
if [[ "$(uname -s)" != "Darwin" ]] ; then
    exit 1
fi

# Install brew itself
if ! which brew >/dev/null ; then
    echo "installing brew"
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" | tee /tmp/brew-install.log
fi

# Make sure we’re using the latest Homebrew and formulas
brew update
brew upgrade

brew install --cocoa --srgb emacs
brew install tmux 
brew install tree
brew install figlet


# Keep chickening out on these
#brew install caskroom/cask/brew-cask
#brew tap caskroom/versions

# brew cask install dropbox 2> /dev/null
# brew cask install google-chrome 2> /dev/null
# brew cask install iterm2 2> /dev/null
# brew cask install the-unarchiver 2> /dev/null
# brew cask install transmission 2> /dev/null
# brew cask install virtualbox 2> /dev/null
# brew cask install vlc 2> /dev/null

# Remove outdated versions from the cellar
brew cleanup

## END OF LINE ##

