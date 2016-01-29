;;; Reconstruct some of the "prod" customizations on "corp"

(require 'highlight-80+)

(add-hook 'python-mode-hook
          (lambda ()
            (setq-default highlight-80+-columns 78)
            (highlight-80+-mode t)
            ))

;; show trailing whitespace ...
;(set-face-background 'trailing-whitespace "#900000")
;(setq-default show-trailing-whitespace t)
;; ... and terminate with extreme prejudice
(defun delete-trailing-whitespace-sometimes () ""
  (if (not (eq major-mode 'diff-mode))
      (delete-trailing-whitespace)))
(add-hook 'write-file-hooks 'delete-trailing-whitespace-sometimes)

;; don't show trailing whitespaces on terminals!
(add-hook 'term-mode-hook
          (lambda () (setq show-trailing-whitespace nil)))


;; a valient attempt, but zsh makes even regex's not sufficient...
;;(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

;; MUST HAVE MATCHING TERM SETUP IN .ZSHRC!!
(setq-default tramp-terminal-type "tramp")


;;;; Everything below was useful on the "prod" side of the house.

;; (defvar master-dir (getenv "ADMIN_SCRIPTS"))
;; (defvar master-emacs (concat master-dir "/master.emacs"))
;; (if (file-exists-p master-emacs)
;;     (load-library master-emacs))

;; Now undue the sillyness

;; This breaks tmux.conf amongst other things
;(remove-hook 'write-file-hooks 'delete-trailing-whitespace-sometimes)
;(remove-hook 'write-file-hooks 'delete-trailing-whitespace)

;; No, I don't want to see it either
;(setq-default highlight-80+-columns 80)
;(setq-default show-trailing-whitespace nil)
;(setq-default highlight-80+-mode nil)


;; END OF LINE ;;
