## -*- mode: fish -*- ##

#usage: title short_tab_title looooooooooooooooooooooggggggg_windows_title
#http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#ss3.1
#Fully support screen, iterm, and probably most modern xterm and rxvt
#Limited support for Apple Terminal (Terminal can't set window or tab separately)
# function title {
#     if [[ "$DISABLE_AUTO_TITLE" == "true" ]] || [[ "$EMACS" == *term* ]] || [[ -n "$TMUX" ]] ; then
#       return
#     fi
#     if [[ "$TERM" == screen* ]]; then
#       print -Pn "\ek$1:q\e\\" #set screen hardstatus, usually truncated at 20 chars
#     elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ $TERM == ansi ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
#       print -Pn "\e]2;$2:q\a" #set window name
#       print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
#     fi
#   }

# function badge {
#     # only iterm supports badges, so anyting else is silly
  
#     if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
#       printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n "$@" | base64)
#     fi
#   }



## EOF ##