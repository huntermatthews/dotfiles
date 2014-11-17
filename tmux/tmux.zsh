#-*- mode: sh -*-

if [[ -n "TMUX" ]]; then  

# 40 years on and we still can't all agree on what the fucking backspace key is
# This might well be osx or iterm2 or tmux or rhel or linux or emacs or whatever.
# But at this point everything ELSE is in agreement and now tmux is as well.
# Why this affected emacs but NOT the zsh shell is another mystery.
# AND I just tested screen itself and it does NOT have this problem.
stty erase '^?'

alias tmux-reload='tmux source-file ~/.tmux.conf'

fi ## running in tmux session


## END OF LINE ##
