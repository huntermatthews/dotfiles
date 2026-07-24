function brew-about
    set do_url 0

    if test $argv[1] = -u
        set do_url 1
        set argv $argv[2..-1]
    end

    brew info --json $argv | jq -r -c '.[] | "\(.name): \(.desc)"'

    if test $do_url = 1
        open -g $(brew info --json $argv | jq -r .[].homepage)
    end
end
