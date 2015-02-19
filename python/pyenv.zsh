# -*- mode: sh -*-

if [[ $DISPLAY_HOSTNAME != "digger" ]] ; then
    return
fi

export PYENV_ROOT=/usr/local/opt/pyenv

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

## END OF LINE ##
