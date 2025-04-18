# -*- mode: fish -*-

# This applies to DOTS as a whole - not just one script - so we set it in the common library.
set -g DOTS_VERSION "0.80"
set -g DOTS_COMMON_REQUIRED_PROGRAMS

# FIXME: This should NOT panic, but return false
function dots_require_universal_variables
    for var in $argv
        if not set -q -U $var
            panic "$var is not set (at all) as a universal variable"
        end
    end
end

# FIXME: This should NOT panic, but return false
function dots_require_directories
    for var in $argv
        if not test -d $var
            panic "$var is not a directory"
        end
    end
end

function dots_require_programs
    # this is just command -v, BUT I want to be able to check for multiple programs at once.
    for prog in $argv
        if not command -v $prog
            return 1
        end
    end
    return 0
end

function dots_require_profile_to_be_valid
    # here, 'valid' means that the dir exists.
    if contains $DOTS_PROFILE (dots_profile_list)
        return 0
    else
        return 1
    end
end

function dots_require_base_config
    # Require that certain universal variables exist
    dots_require_universal_variables DOTS DOTS_LOCAL DOTS_PROFILE

    # Require our DOTS_PROFILE to be in the list of possible profiles. (IE, dir that exists)
    dots_require_profile_to_be_valid

    # Require certain directories exist
    # NOTE: we don't test the profile dir again here because we did that above.
    dots_require_directories $DOTS $DOTS_LOCAL $DOTS/libexec/dots

    dots_require_programs $DOTS_COMMON_REQUIRED_PROGRAMS

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

    # We need 1 positional argument = the pattern to match
    if test (count $argv) -ne 1
        panic "missing required arguments"
    end

    set -l pattern $argv[1]
    debug --var pattern

    # Get ALL the pattern matched files - including ALL the profiles
    # We DON"T search deeply - by design so far.
    set files $DOTS/*/*$pattern
    debug --var-spaces files

    # Dumb but effective - remove ALL the profile related files
    set files (string match --entire --invert _profile $files)
    debug --var-spaces files

    # Now grab only the active profile files
    set profile_files $DOTS/{$DOTS_PROFILE}_profile/*$pattern
    debug --var-spaces profile_files

    # and add those profile files back into the main list
    # FIXED: put profile at end to allow for overrides.
    set files $files $profile_files
    debug --var-spaces files

    echo $files
end

# For all of dots, this is correct - my code, my rules.
function fish_command_not_found
    exit 12
end

# from https://fishshell.com/docs/current/cmds/fish_git_prompt.html:
# "Boolean options (those which enable or disable something) understand “1”, “yes” or “true” to
# mean true and every other value to mean false." Should I add "True" to this list?
# Recall that for SHELL/fish programming, an 'if' test is reversed from normal boolean logic.
#      Think of it like this - did X fail? if X == 'did X fail?' -- which cause the true block to be '0'
#      Yes, shell programming is weird - its not my fault.
function is_true
    set truths true yes 1
    if contains $arg $truths
        return 0
    end
    return 1
end
function is_false
    set truths true yes 1
    if contains $arg $truths
        return 1
    end
    return 0
end
function is_false_or_empty
    # This is a bit of a hack - but it works.
    # We want to check for empty or false - so we check for empty first.
    # If its empty, we return success(0). If its not empty, we check for false.
    # If its false, we return success. If its not false, we return failure.
    if test -z $arg
        return 0
    end
    if is_false $arg
        return 0
    end
    return 1
end

function dots_profile_list
    echo path filter --type dir $DOTS/*_profile | string _profile ''
end

##
## Future
##

## END OF LINE ##
