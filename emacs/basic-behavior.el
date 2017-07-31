;; enable visual feedback on selections
(setq transient-mark-mode t)

;; always end a file with a newline
(setq require-final-newline 't)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; use ibuffer instead of the normal buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; WHy is goto-line not a standard mapping?
(global-set-key "\M-g" 'goto-line)

;; I always want line and column numbers - cheap and occasionally useful.
(setq line-number-mode t)
(setq column-number-mode t)

;; Make buffers more betterer
(require 'ido)
(ido-mode t)
(global-set-key "\C-x\C-b" 'ibuffer)

;; scrolling should move point to top or bottom of file (IE, be reasonable)
(setq scroll-error-top-bottom 't)

;; unbind c-\ which I use for tmux/screen
(global-unset-key "\C-\\")

;; Apparently its electric mode that makes cut -n paste wonky in emacs
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;; Disable stuff I don't use.
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; emacs makes read only HARD - no idea why
(global-set-key [f12] (lambda () (interactive) (setq buffer-read-only t)))

;; END OF LINE ;;
