(defvar master-dir (getenv "ADMIN_SCRIPTS"))
(defvar master-emacs (concat master-dir "/master.emacs"))
(if (file-exists-p master-emacs)
    (load-library master-emacs))

;; Now undue the sillyness

;; This breaks tmux.conf amongst other things
(remove-hook 'write-file-hooks 'delete-trailing-whitespace-sometimes)
(remove-hook 'write-file-hooks 'delete-trailing-whitespace)

;; No, I don't want to see it either
(setq-default highlight-80+-columns 120)
(setq-default show-trailing-whitespace nil)
(setq-default highlight-80+-mode nil)


;; END OF LINE ;;
