# Brew can be installed in two different locations, at least until 
# intel macs are no longer a thing.
for location in /opt/homebrew/bin/brew /usr/local/bin/brew ; do
    if [[ -x $location  ]]; then
        eval $($location shellenv)
    fi
done

if [[ -z $HOMEBREW_PREFIX ]]; then
    echo "ERROR: did not setup homebrew corerctly"
fi

