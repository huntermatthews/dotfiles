# -*- mode: fish -*-

# This applies to DOTS as a whole - not just one script - so we set it in the common library.
set -g DOTS_VERSION "0.10"

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
    dots_require_directories $DOTS $DOTS_LOCAL $DOTS/$DOTS_PROFILE_profile $DOTS/libexec/dots

    # TODO: Make sure that the profile is set to an actual _profile dir in $DOTS

end

function debug -S
    # The -S is magic that allows this debug function to peer into other functions private variables...
    # Its NOT all powerful - note that debugging "argv" from other functions WILL fail if you attempt to use it here.
    # Instead >> debug "argv == '$argv'" << is required. Sorry.
    if set -q FLAG_DEBUG; and test "$FLAG_DEBUG" = true
        # BUG: - test for "argv" itself and report the user is a moron.
        if test $argv[1] = --var
            # echo here 1>&2
            echo "DEBUG: variable $argv[2] == '$$argv[2]'" 1>&2
        else if test $argv[1] = --var-spaces
            # echo there 1>&2
            set -l count (count $$argv[2])
            if test $count -eq 0
                echo "DEBUG: variable $argv[2] of length $count == '$$argv[2]'" 1>&2
            else
                echo "DEBUG: variable $argv[2] of length $count:" 1>&2
                for i in (seq (count $$argv[2]))
                    echo "     debug: index: $i, Value: $$argv[2][$i]" 1>&2
                end
            end
        else
            # echo nowhere 1>&2
            echo "DEBUG: $argv" 1>&2
        end
    end
end

function panic
    if set -q FLAG_DEBUG; and test "$FLAG_DEBUG" = true
        status stack-trace
    end

    echo "FATAL: in $argv"
    exit 1
end

function dots_files_with_active_profile

    # We need 1 positional arguments = the pattern to match
    if test (count $argv) -ne 1
        panic "missing required arguments"
    end

    set -l pattern $argv[1]
    debug --var pattern

    # Get ALL the pattern matched files - including ALL the profiles
    set files $DOTS/*/*$pattern
    debug --var-spaces files

    # Dumb but effective - remove ALL the profile related files
    set files (string match --entire --invert _profile $files)
    debug --var-spaces files

    # Now grab only the active profile files
    set profile_files $DOTS/{$DOTS_PROFILE}_profile/*$pattern
    debug --var-spaces profile_files

    # and add those profile files back into the main list
    # BUGFIX: put profile at end to allow for overrides.
    set files $files $profile_files
    debug --var-spaces files

    echo $files
end

##
## Future
##

# TODO: write an is_true/is_false that allows 1/0 true/false True/False etc

# TODO: dots_require_programs - check for the existence of programs in $PATH
# isn't that just command -v? Yes, but I want to be able to check for multiple programs at once.

# TODO: dots_profile_list - look for correct pattern and return names

## END OF LINE ##
