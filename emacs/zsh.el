;; Make emacs understand that zsh/zshenv files are shell
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zshenv\\'" . sh-mode))

;(add-hook 'sh-mode-hook (lambda () (setq tab-width 0 sh-basic-offset 4 indent-tabs-mode nil)))
;; END OF LINE ;;
