# meh

# Store command location for speed
setopt hash_cmds

# name of dir as command? cd to it.
setopt auto_cd

# Do directory expansion on variables, works with auto_cd (sometimes?) above
setopt cdablevars

# Beeping is the work of the devil
setopt no_beep
setopt nolistbeep

# Perform implicit tees or cats when multiple redirections are attempted
## Leftover? Do I use this?
setopt multios 

# Makes negative globs work
# ls -l id_*~*.pub     ## List all ssh private keys (IE, anything not ending in .pub)
setopt extendedglob

## END OF LINE ##
