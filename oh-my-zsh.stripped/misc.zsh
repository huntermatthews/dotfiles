## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
#export PAGER="less"   # zsh/basics.zshenv
#export LESS="-R"      # zsh/basics.zshenv

export LC_CTYPE=$LANG
