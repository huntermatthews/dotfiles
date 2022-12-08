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
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" | tee /tmp/brew-install.log
fi

# Make sure we’re using the latest Homebrew and formulas
brew tap homebrew/cask
brew update
brew upgrade

# Install some base packages.
pkgs=(
tmux 
tree
figlet
joe
no-more-secrets
pyenv 
pyenv-which-ext
python
rg
xz
)

for pkg in $pkgs ; do 
    brew install $pkg
done

# Install some GUI programs as well.
pkgs=(
appcleaner
iterm2
sublime-text
)

for pkg in $pkgs ; do 
   brew install --cask --no-quarantine $pkg 
done

# Remove outdated versions from the cellar
brew cleanup

## END OF LINE ##

