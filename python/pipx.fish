## Add all the osx specific path locations

if command -v pipx
    # PipX installs everything in ~/.local/bin
    fish_add_path --global --move --path ~/.local/bin
end

## END OF LINE ##
