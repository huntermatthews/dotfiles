# -*- mode: sh -*-

# Clock part was  %{$fg[white]%}[%T]%{$reset_color%}

# If you hit an OLD zsh version without promptsp, check your git history - there's a no-removed
# workaround for this.
setopt promptsp

# Setup the prompt with pretty colors
setopt prompt_subst

export ZSH_THEME_TERM_TITLE_IDLE="%n@$DISPLAY_HOSTNAME: %~"
if is_prod ; then
    PROMPT_HOST_COLOR="$FG[208]"   # Nice noticable orange
else
    PROMPT_HOST_COLOR="$fg[white]"
fi

PROMPT=$'
%{$fg[blue]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)$(svn_prompt_info)%{$fg[green]%}$(pyenv_prompt_info)%{$reset_color%}%{$PROMPT_HOST_COLOR%}[%n@$DISPLAY_HOSTNAME]%{$reset_color%}
%{$fg_bold[black]%}>%{$reset_color%} '

PROMPT2="%{$fg_bold[black]%}%_> %{$reset_color%}"

ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[green]%}["

