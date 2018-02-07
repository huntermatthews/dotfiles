_homebrew-installed() {
    type brew &> /dev/null
}

_pyenv-from-homebrew-installed() {
    brew --prefix pyenv &> /dev/null
}

FOUND_PYENV=0
pyenvdirs=("$HOME/.pyenv" "/usr/local/pyenv" "/opt/pyenv")
if _homebrew-installed && _pyenv-from-homebrew-installed ; then
    pyenvdirs=($(brew --prefix pyenv) "${pyenvdirs[@]}")
fi

for pyenvdir in "${pyenvdirs[@]}" ; do
    if [ -d $pyenvdir/bin -a $FOUND_PYENV -eq 0 ] ; then
        FOUND_PYENV=1
        export PYENV_ROOT=$pyenvdir
        export PATH=${pyenvdir}/bin:$PATH
        eval "$(pyenv init - zsh)"
        eval "$(pyenv virtualenv-init - zsh)"

        function pyenv_prompt_info() {
            echo "[py:$(pyenv version-name)] "   # gah I hate that space
        }
    fi
done
unset pyenvdir

if [ $FOUND_PYENV -eq 0 ] ; then
    function pyenv_prompt_info() { echo "[python: $(python -V 2>&1 | cut -f 2 -d ' ')] " }
fi