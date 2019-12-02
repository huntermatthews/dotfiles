#! /usr/bin/env zsh
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
set -o shwordsplit

# Brew/homebrew is a mac only thing - don't run this elsewhere
is_mac || return

# Install brew itself
if ! which brew >/dev/null ; then
    echo "installing brew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" | tee /tmp/brew-install.log
fi

# Make sure we’re using the latest Homebrew and formulas
brew update
brew upgrade

pkgs=(
tmux 
tree
figlet
joe
no-more-secrets
pyenv 
pyenv-virtualenv
pyenv-which-ext
python
pipx
xz
)

for pkg in $pkgs ; do 
    brew install $pkg
done

#pkgs=(
#1password
#appcleaner
#iterm2
#mou
#sublime-text
#the-unarchiver
#totalspaces
#vlc
#)

#for pkg in $pkgs ; do 
#    brew cask install $pkg 2> /dev/null
#done

# Remove outdated versions from the cellar
brew cleanup

## END OF LINE ##

