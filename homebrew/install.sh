#! /usr/bin/env zsh
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

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

pkgs=(
"--cocoa --srgb emacs"
tmux 
tree
figlet
)

for pkg in $pkgs ; do 
    brew install $pkg
done


brew install caskroom/cask/brew-cask
brew tap caskroom/versions

pkgs=(
1password
alinof-timer
adobe-photoshop-lightroom
appcleaner
busycal
caffeine
dropbox
firefox
google-drive
google-earth
google-chrome
iterm2
jettison
mou
skype
sublime-text
the-unarchiver
totalspaces
transmission
virtualbox
vlc
yubikey-personalization-gui
)

for pkg in $pkgs ; do 
    brew cask install $pkg 2> /dev/null
done


# Remove outdated versions from the cellar
brew cleanup

## END OF LINE ##

