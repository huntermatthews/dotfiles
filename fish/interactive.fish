## -*- mode: fish -*- ##

# TODO: Review the pragmas

# BUG: This needs a interactive test / exit
# TODO: Enable ls colors
set -gx LSCOLORS ExGxFxDxCxDxDxHbaDaCec

# TODO: grep color

# TODO: history

# TODO: completions

# TODO: prompt
# export ZSH_THEME_TERM_TITLE_IDLE="%n@$DISPLAY_HOSTNAME: %~"
# if is_prod ; then
#     PROMPT_HOST_COLOR="$FG[208]"   # Nice noticable orange
# else
#     PROMPT_HOST_COLOR="$fg[white]"
# fi
set -U __fish_git_prompt_showdirtystate yes

## EOF ##
