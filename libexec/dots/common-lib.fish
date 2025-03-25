# -*- mode: fish -*-

# This applies to DOTS as a whole - not just one script - so we set it in the common library.
set -g DOTS_VERSION "0.1"

function dots_require_universal_variables
    for var in $argv
        if not set -q -U $var
            panic "$var is not set (at all) as a universal variable"
        end
    end
end

function dots_require_directories
    for var in $argv
        if not test -d $var
            panic "$var is not a directory"
        end
    end
end

function dots_require_base_config
    # Require that certain universal variables exist
    dots_require_universal_variables DOTS DOTS_LOCAL DOTS_PROFILE

    # Require certain directories exist
    dots_require_directories $DOTS $DOTS_LOCAL $DOTS/$DOTS_PROFILE $DOTS/libexec/dots

    # TODO: Make sure that the profile is set to an actual _profile dir in $DOTS

end

function debug -S
    # The -S is magic that allows this debug function to peer into other functions private variables...
    # Its NOT all powerful - note that debugging "argv" from other functions WILL fail if you attempt to use it here.
    # Instead >> debug "argv == '$argv'" << is required. Sorry.
    if set -q FLAG_DEBUG; and test "$FLAG_DEBUG" = true
        # BUG: - test for "argv" itself and report the user is a moron.
        if test $argv[1] = --var
            echo here
            echo "DEBUG: variable $argv[2] == '$$argv[2]'"
        else if test $argv[1] = --var-spaces
            echo there
            set -l count (count $$argv[2])
            if test $count -eq 0
                echo "DEBUG: variable $argv[2] of length $count == '$$argv[2]'"
            else
                echo "DEBUG: variable $argv[2] of length $count:"
                for i in (seq (count $$argv[2]))
                    echo "     debug: index: $i, Value: $$argv[2][$i]"
                end
            end
        else
            echo nowhere
            echo "DEBUG: $argv"
        end
    end
end

function panic
    echo "FATAL: $argv"
    exit 1
end

# END OF LINE #
