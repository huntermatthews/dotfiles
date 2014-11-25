# old directory names that were blowing up .zshrc file finding (finding dupes and out of order)
rm -rf $HOME/.dotfiles/functions
rm -rf $HOME/.dotfiles/oh-my-zsh
rm -rf $HOME/.dotfiles/zsh-custom

# This was replaced with an alias - no more .reviewbaordrc on osx
rm -rf $HOME/.dotfiles/amazon/.reviewboardrc
rm -rf $HOME/.reviewboardrc

# This is dangerous long term but fine right now
# .localrc was supposed to get me out of having amazon stuff in a public repo.
rm -rf $HOME/.localrc

## END OF LINE ##
