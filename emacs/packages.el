;(when (string= (getenv "NO_OUTSIDE_NET") "FALSE")

;; Pull from stable?
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;(defvar my-packages '(starter-kit zenburn-theme auctex color-theme-solarized csharp-mode ecb_snap find-file-in-project flymake-css flymake-php idle-highlight ido-ubiquitous ipython python-mode magit markdown-mode paredit pastels-on-dark-theme php-mode rainbow-mode smex solarized-theme starter-kit-js zenburn-theme)
;;  "A list of packages to ensure are installed at launch.")

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(rust-mode yaml-mode))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;) ;; (when (string= (getenv "EMACS_DISABLE_ELPA") "FALSE")

;; END OF LINE ;;
