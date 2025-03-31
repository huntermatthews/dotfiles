## -*- mode: fish -*- ##

function iterm_badge
    # only iterm supports badges, so anything else is silly

    if test "$TERM_PROGRAM" = "iTerm.app"
        printf "\e]1337;SetBadgeFormat=%s\a" (echo -n "$argv" | base64)
    end
end

## END OF LINE ##
