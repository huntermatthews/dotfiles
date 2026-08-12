function fish_right_prompt
    if set -q CHEZMOI_SOURCE_DIR
        set_color --bold yellow
        echo -n '[chezmoi]'
        set_color normal
    end
end
