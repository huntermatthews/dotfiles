# -*- mode: sh -*-

# Yes, this file SHOULD be .zsh -- we're picking up the final path set in *.zshenv 
# Apple attempts to "fix" our path in zprofile - I REALLY don't want that, so we override that here.
PATH=$dotfiles_path
dotfiles_debug ZSHRC FIXED PATH $path

## END OF LINE ##