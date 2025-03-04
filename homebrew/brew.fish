## -*- mode: fish -*- ##

eval (/opt/homebrew/bin/brew shellenv)

if [ -z $HOMEBREW_PREFIX ]
    echo "ERROR: did not setup homebrew correctly"
end

# see ~/.dots_local/git.fish for TOKEN definition.

# make unfortunately is installed as gmake. Because of $TEAM, I need it to be "make"
if brew list make 1>/dev/null 2>&1
    fish_add_path --global --move --path /opt/homebrew/opt/make/libexec/gnubin
end

function brew-about
    open -g (brew info --json make | jq .[0].homepage)
end

## EOF ##
