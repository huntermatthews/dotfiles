# Make an alias to add the .dotfiles/git directory to the path ONLY for the git command.
# This will do what we want with git, and clean out a bunch of junk from bin.

alias git='path+=($HOME/.dotfiles/git) git'

## END OF LINE ##
