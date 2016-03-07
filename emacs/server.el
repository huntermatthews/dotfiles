;; server mode customizations

;;; Here's the .zshrc code i have in machines I commonly tramp edit on.
;;; Otherwise, zsh confuses tramp/emacs.
;;; This is just documentation for when I have to set this up next.
;; if [[ "$TERM" == "tramp" ]]
;; then
;;   unsetopt zle
;;   unsetopt prompt_cr
;;   unsetopt prompt_subst
;;   PS1='tramp$ '
;;   return
;; fi

; C-x c-s to save a file and c-x c-c to "exit" are 20 year old muscle memory by now.
; But in server mode, I want c-x c-c to be "server-edit"
; So, reverse the functions bound to c-x c-c and c-x #
; I'm sure this will blow up on me at some point.
;
(global-set-key (kbd "C-x %") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'server-edit)

; Tramp mode
(setq tramp-default-method "ssh")

;; END OF LINE ;;
