#! /bin/bash

# shellcheck disable=SC2312

HELP="\
Usage: install.sh [--help] [--verbose] --work|--home
  --help     - Display this help message.
  --verbose  - Display verbose output.
  --work     - Configure as a work machine.
  --home     - Configure as a home machine.

One and only one of --work or --home is required.
"

VERBOSE=0
PROFILE=""
DATE_FMT="%Y-%m-%dT%H:%M:%SZ"

panic() {
    echo "FATAL: $1" >&2
    exit 1
}

verbose() {
    if [ "$VERBOSE" -eq 1 ]; then
        echo "INFO: $1"
    fi
}

while [ $# -gt 0 ]; do
    case "$1" in
        -v|--verbose)
            VERBOSE=1
            ;;
        -h|--help)
            echo "$HELP"
            exit 0
            ;;
        --work)
            PROFILE="work"
            ;;
        --home)
            PROFILE="home"
            ;;
        *)
            panic "Unknown option: $1" >&2

            ;;
    esac
    shift
done

if [ -z "$PROFILE" ]; then
    panic "one of --work or --home is required"
fi

if [ "$PROFILE" = "work" ]; then
    if [ -f "$HOME/.dotfiles_is_home" ]; then
        panic "~/.dotfiles_is_home already exists -- remove it before switching to --work"
    fi
    date -u +"$DATE_FMT" > "$HOME/.dotfiles_is_work"
else
    if [ -f "$HOME/.dotfiles_is_work" ]; then
        panic "~/.dotfiles_is_work already exists -- remove it before switching to --home"
    fi
    date -u +"$DATE_FMT" > "$HOME/.dotfiles_is_home"
fi

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
## Install chezmoi from brew -
##
verbose "Checking for chezmoi (pkg)..."
if ! brew info chezmoi  > /dev/null 2>&1 ; then
    echo "Installing chezmoi..."
    brew install chezmoi
    if [ $? -ne 0 ]; then
        panic "Failed to 'brew install chezmoi'"
    fi
fi

##
## Chezmoi will install the repo in the right place AND apply it.
##
# we use the full path because we might just have installed homebrew itself
# and we don't have working pathing yet.
/opt/homebrew/bin/chezmoi init huntermatthews/dotfiles --apply

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

echo -e "\n\n"
echo "*** The bootstrap is complete. ***"
echo "*** Now you can start iterm2 and fish should be ready to go. ***"
echo "*** chezmoi should have created a ~/.dotfiles symlink for easy access. ***"
echo "*** Enjoy! ***"
