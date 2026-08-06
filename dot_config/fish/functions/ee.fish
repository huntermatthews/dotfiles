function ee
    set -l target $argv[1]
    test -z "$target"; and set target (git rev-parse --show-toplevel 2>/dev/null)
    test -z "$target"; and set target .
    zed -n $target
end
