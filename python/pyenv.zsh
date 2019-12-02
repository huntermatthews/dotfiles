# -*- mode: sh -*-

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT=/usr/local/opt/pyenv

if which pyenv > /dev/null 2>&1 ; then
    eval "$(pyenv init -)"
    #export PATH=${pyenvdir}/bin:$PATH
    function pyenv_prompt_info() {
        echo "[py:$(pyenv version-name)] "   # gah I hate that space
    }
else
    function pyenv_prompt_info() { 
        echo "[python: $(python -V 2>&1 | cut -f 2 -d ' ')] " # gah I hate that space
    }
fi

if which pyenv-virtualenv-init > /dev/null 2>&1 ; then
    eval "$(pyenv virtualenv-init -)"
fi


## END OF LINE ##
