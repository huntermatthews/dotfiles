# -*- mode: sh -*-

export PYENV_ROOT=~/.local/pyenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

if which pyenv > /dev/null 2>&1 ; then
    eval "$(pyenv init -)"
    export PATH=$(pyenv root)/shims:$PATH
fi

function pyenv_prompt_info() {
    if [[ -v VIRTUAL_ENV ]] ; then
        echo "[venv3: ${$(python3 -V)#Python }] "
    else
        echo "[py3: ${$(python3 -V)#Python }] "   # gah I hate that space
    fi
}

## Causing more trouble than it was worth with poetry.
# Switch to direnv for equivalent and generic support.
#if which pyenv-virtualenv-init > /dev/null 2>&1 ; then
#    eval "$(pyenv virtualenv-init -)"
#fi


## END OF LINE ##
