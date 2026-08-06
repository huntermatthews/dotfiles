###########################
# BASICS
###########################

set -gx LESS RiX
set -gx PAGER less

set -gx EDITOR "zed"
set -gx LSCOLORS ExGxFxDxCxDxDxHbaDaCec

# Get our dotfiles bin directory into the path
fish_add_path --global --move --path $HOME/bin

# Get rid of the regular startup message
set fish_greeting ""


###########################
# BINDINGS
###########################

# Got this from Gillian's dotfiles
bind ctrl-c __fish_cancel_commandline

###########################
# PROMPT
###########################
set -gx __fish_git_prompt_showdirtystate true
set -gx __fish_git_prompt_showstashstate true
