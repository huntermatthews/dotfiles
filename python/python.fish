## -*- mode: fish -*- ##

# Prevent pip and sometimes pyenv from making a mess of things.
# If I need it globably, I have to unset the variable.
set -gx PIP_REQUIRE_VIRTUALENV true

# PipX installs everything in ~/.local/bin
fish_add_path --global --move --path ~/.local/bin


## END OF LINE ##
