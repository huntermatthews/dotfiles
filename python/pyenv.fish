## -*- mode: fish -*- ##

export PYENV_ROOT=~/.local/pyenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

if command -v pyenv >/dev/null 2>&1
    pyenv init - fish | source
end


# function pyenv_prompt_info() {
#     if [[ -v VIRTUAL_ENV ]] ; then
#         echo "[**VENV**: ${$(python3 -V)#Python }] "
#     else
#         echo "[py: ${$(python3 -V)#Python }] "   # gah I hate that space
#     fi
# }


## END OF LINE ##
