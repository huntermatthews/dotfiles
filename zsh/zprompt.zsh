# -*- mode: sh -*-

# Clock part was  %{$fg[white]%}[%T]%{$reset_color%}

# If you hit an OLD zsh version without promptsp, check your git history - there's a no-removed
# workaround for this.
setopt promptsp

export ZSH_THEME_TERM_TITLE_IDLE="%n@$DISPLAY_HOSTNAME: %~"
if is_prod ; then
    PROMPT_HOST_COLOR="$FG[208]"   # Nice noticable orange
else
    PROMPT_HOST_COLOR="$fg[white]"
fi

PROMPT=$'
%{$fg[blue]%}%/%{$reset_color%} $(git_prompt_info)$(svn_prompt_info)%{$fg[green]%}$(pyenv_prompt_info)%{$reset_color%}%{$PROMPT_HOST_COLOR%}[%n@$DISPLAY_HOSTNAME]%{$reset_color%}
%{$fg_bold[black]%}>%{$reset_color%} '

PROMPT2="%{$fg_bold[black]%}%_> %{$reset_color%}"

ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[green]%}["

GIT_CB="git::"
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

SVN_CB="svn::"
ZSH_THEME_SVN_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$SVN_CB
ZSH_THEME_SVN_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_SVN_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_SVN_PROMPT_CLEAN=""
