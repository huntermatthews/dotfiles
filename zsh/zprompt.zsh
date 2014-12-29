# -*- mode: sh -*-

# Clock part was  %{$fg[white]%}[%T]%{$reset_color%}

## 
## So this is convoluted
## 
## zsh 4.3.0 adds a "promptsp" setopt option which fixes this
## FAQ: 3.23 from http://zsh.sourceforge.net/FAQ/zshfaq03.html
## if only work would deploy a newer zsh
##

if ! eval '[[ -o promptsp ]] 2>/dev/null'; then
    function precmd {
        # An efficient version using termcap multi-right:
        echo -n ' '       # Output 1 space
        echotc RI $((COLUMNS - 3))
        echo -n '  '      # Output 2 spaces
        # Alternately, try replacing the above 3 lines with this echo
        # that outputs a screen-column-width of spaces:
        #echo -n ${(l:$COLUMNS:::):-}
    }
else
    setopt promptsp
fi

export ZSH_THEME_TERM_TITLE_IDLE="%n@$DISPLAY_HOSTNAME: %~"

PROMPT=$'
%{$fg[blue]%}%/%{$reset_color%} $(git_prompt_info)%{$fg[white]%}[%n@$DISPLAY_HOSTNAME]%{$reset_color%}
%{$fg_bold[black]%}>%{$reset_color%} '

PROMPT2="%{$fg_blod[black]%}%_> %{$reset_color%}"

GIT_CB="git::"
ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
