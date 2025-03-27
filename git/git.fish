## -*- mode: fish -*- ##

# Make an alias to add the .dotfiles/git directory to the path ONLY for the git command.
# This will do what we want with git, and clean out a bunch of junk from bin.

alias git 'PATH=$HOME/.dotfiles/git:$PATH command git'

## END OF LINE ##
