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
    #ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" | tee /tmp/brew-install.log
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" | tee /tmp/brew-install.log
fi

# Make sure we’re using the latest Homebrew and formulas
brew update
brew upgrade

pkgs=(
tmux 
tree
figlet
)

for pkg in $pkgs ; do 
    brew install $pkg
done

#FIXME: whats the right freaking way to do this with zsh
brew install --with-cocoa --srgb emacs

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

pkgs=(
1password
alinof-timer
adobe-photoshop-lightroom
appcleaner
busycal
google-drive
google-earth
iterm2
jettison
mou
sublime-text
the-unarchiver
totalspaces
transmission
virtualbox
vlc
)

for pkg in $pkgs ; do 
    brew cask install $pkg 2> /dev/null
done

# Packages that $work handles for me - so I need these at home...
work_pkgs=(
caffeine
dropbox
firefox               # not sure about this one 
google-chrome         # not sure about this one 
skype
yubikey-personalization-gui
)

# Remove outdated versions from the cellar
brew cleanup

## END OF LINE ##

