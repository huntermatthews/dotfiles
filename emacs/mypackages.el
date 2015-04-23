
;; Pull from stable?
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;(defvar my-packages '(starter-kit zenburn-theme auctex color-theme-solarized csharp-mode ecb_snap find-file-in-project flymake-css flymake-php idle-highlight ido-ubiquitous ipython python-mode magit markdown-mode paredit pastels-on-dark-theme php-mode rainbow-mode smex solarized-theme starter-kit-js zenburn-theme)
;;  "A list of packages to ensure are installed at launch.")

(defvar my-packages '(rust-mode)
 "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
          (package-install p)))

;; END OF LINE ;;
