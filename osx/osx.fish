## -*- mode: fish -*- ##

## Finger memory says its md5sum
alias md5sum 'md5 -r'

# make unfortunately is installed as gmake. Because of $TEAM, I need it to be "make"
# and it can't be an alias.... dangit.
if brew list make 1>/dev/null 2>&1
    fish_add_path --global --move --path /opt/homebrew/opt/make/libexec/gnubin
end

## END OF LINE ##
