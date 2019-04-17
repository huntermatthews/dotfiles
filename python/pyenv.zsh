# -*- mode: sh -*-

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

if which pyenv > /dev/null 2>&1 ; then
    export PYENV_ROOT=/usr/local/pyenv
    eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null 2>&1 ; then
    eval "$(pyenv virtualenv-init -)"
fi

#function pyenv_prompt_info() {
#            echo "$(pyenv version-name)"
#        }
## END OF LINE ##
