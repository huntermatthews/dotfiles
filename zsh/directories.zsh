# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
# setopt auto_param_slash

alias d='dirs -v | head -10'

function md() { mkdir -p $1 && cd $1 }
alias rd=rmdir
