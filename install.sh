#! /bin/sh

# shellcheck disable=SC2312

if [ "$1" = "-v" -o "$1" = "--verbose" ]; then
    VERBOSE=1
elif [ "$1" = "-h" -o "$1" = "--help" ]; then
    echo "Usage: dots-bootstrap.sh [--help] [--verbose]"
    echo "  --help    - Display this help message."
    echo "  --verbose - Display verbose output."
    exit 0
fi

panic() {
    echo "FATAL: $1" >&2
    exit 1
}

verbose() {
    if [ -n "$VERBOSE" ]; then
        echo "INFO: $1"
    fi
}

##
## This script is intended only for macOS
##
verbose "Checking OS being MacOS..."
if [ "$(uname)" != "Darwin" ]; then
    panic "Sorry, this script is (currently) intended only for macOS."
fi

##
## Install xcode command line tools as a dep of homebrew
## xcode-select will be there - builtin to macOS - but are the tools installed?
##
verbose "Checking for Xcode Command Line Tools..."
if ! xcode-select -p >/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    if [ $? -ne 0 ]; then
        panic "Failed to install Xcode command line tools."
    fi
fi

##
## Main task - the installation of Homebrew
##
verbose "Checking for Homebrew..."
if ! command -v brew >/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ $? -ne 0 ]; then
        panic "Failed to install Homebrew."
    fi
else
    # Update Homebrew recipes -- in case we didn't install homebrew, we need to update/upgrade it.
    echo "Updating Homebrew..."
    brew update
    if [ $? -ne 0 ]; then
        panic "Failed to update Homebrew."
        exit 1
    fi
    echo "Upgrading Homebrew packages..."
    brew upgrade
    if [ $? -ne 0 ]; then
        panic "Failed to upgrade Homebrew packages."
        exit 1
    fi
fi

##
## Grab the dots repo
##
verbose "Checking for git repo for dots..."
if [ ! -d "$HOME/.dots" ]; then
    # we need a key
    verbose "Checking for key being available..."
    if ! ssh-add -L | grep github >/dev/null 2>&1 ; then
        echo "Adding SSH key to ssh-agent..."
        ssh-add --apple-use-keychain ~/.ssh/id_rsa.github
        if [ $? -ne 0 ]; then
            panic "Failed to add SSH key to ssh-agent."
        fi
    fi

    echo "Cloning dots..."
    git clone git@github.com:huntermatthews/dotfiles.git "$HOME/.dots"
    if [ $? -ne 0 ]; then
        panic "Failed to clone dots."
    fi
fi

## Everything else in dots is dependent on fish and iterm2 makes a nice place to run it.

##
## Install the fish shell to make everything else easier
##
verbose "Checking for fish (pkg)..."
if ! brew info fish  > /dev/null 2>&1 ; then
    echo "Installing fish shell..."
    brew install fish
    if [ $? -ne 0 ]; then
        panic "Failed to brew install fish."
    fi
fi

##
## iterm2 is a great terminal emulator
##
verbose "Checking for iterm2 (pkg)..."
if ! brew info iterm2  > /dev/null 2>&1 ; then
    echo "Installing iterm2..."
    brew install --cask iterm2
    if [ $? -ne 0 ]; then
        panic "Failed to brew install iterm2."
    fi
fi

##
## Initialize the 3 fish universal variables that everything in dots relies on
## Makes sense to do it here since we know everything here...
##
hash -r      # just in case...
fish -c "set -U DOTS ~/.dots ; set -U DOTS_LOCAL ~/.dots_local ; set -U DOTS_PROFILE work"


echo "\n\n"
echo "*** The bootstrap is complete. ***"
echo "*** Now you can run iterm2 and run the 'dots all' command to install the rest of the dots stuff. ***"
echo "*** Enjoy! ***"

## END OF LINE ##
