# -*- mode: fish -*-

# Don't continue if direnv is not found
command -v direnv &>/dev/null || return

direnv hook fish | source

# EOF
