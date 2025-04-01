## -*- mode: fish -*- ##

set -gx PYENV_ROOT ~/.local/pyenv
set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

if command -v pyenv >/dev/null 2>&1
    pyenv init - fish | source
end


## END OF LINE ##
