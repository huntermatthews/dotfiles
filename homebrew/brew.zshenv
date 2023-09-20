# Brew can be installed in two different locations, at least until 
# intel macs are no longer a thing.
# for location in /opt/homebrew/bin/brew /usr/local/bin/brew ; do
#     if [[ -x $location  ]]; then
#         eval $($location shellenv)
#     fi
# done
eval $(/opt/homebrew/bin/brew shellenv)

if [[ -z $HOMEBREW_PREFIX ]]; then
    echo "ERROR: did not setup homebrew corerctly"
fi

# Due to our VPN, I assume - we need a GITHUB token:
export HOMEBREW_GITHUB_API_TOKEN='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'

PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
