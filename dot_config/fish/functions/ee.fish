function ee
    set -l root (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$root"
        $EDITOR -n $root
    else
        $EDITOR -n .
    end
end
