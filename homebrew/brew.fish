## -*- mode: fish -*- ##

eval (/opt/homebrew/bin/brew shellenv)

# TODO: I think this should be an abbrev
function brew-about
    open -g (brew info --json make | jq .[0].homepage)
end

# TODO : convert to abbr ???
#brew info --json cf-terraforming globstar gotz hishtory immich-go kapp kirimase org-formation ov pivy punktf rattler-index semver sequoia-sqv sttr tml yoke ytt | jq -r '.[] | "####",.name,.desc,.homepage,"\n"'

## END OF LINE ##
