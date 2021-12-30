# -*- mode: sh -*-

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYENV_ROOT=~/.local/pyenv

if which pyenv > /dev/null 2>&1 ; then
    eval "$(pyenv init -)"
    export PATH=$(pyenv root)/shims:$PATH
    function pyenv_prompt_info() {
        echo "[py:$(pyenv version-name)] "   # gah I hate that space
    }
else
    function pyenv_prompt_info() { 
        echo "[python: $(python -V 2>&1 | cut -f 2 -d ' ')] " # gah I hate that space
    }
fi

## Causing more trouble than it was worth with poetry.
# Switch to direnv for equivalent and generic support.
#if which pyenv-virtualenv-init > /dev/null 2>&1 ; then
#    eval "$(pyenv virtualenv-init -)"
#fi


## END OF LINE ##
