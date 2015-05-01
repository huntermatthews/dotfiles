# -*- mode: sh -*-

if which pyenv > /dev/null 2>&1 ; then
    export PYENV_ROOT=/usr/local/opt/pyenv
    eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null 2>&1 ; then
    eval "$(pyenv virtualenv-init -)"
fi

## END OF LINE ##
