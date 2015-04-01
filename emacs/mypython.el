(setq-default python-indent-offset 4)

;; Make emacs understand that python2.7 is python
(add-to-list 'interpreter-mode-alist '("python2" . python-mode))
(add-to-list 'interpreter-mode-alist '("python2.4" . python-mode))
(add-to-list 'interpreter-mode-alist '("python2.5" . python-mode))
(add-to-list 'interpreter-mode-alist '("python2.6" . python-mode))
(add-to-list 'interpreter-mode-alist '("python2.7" . python-mode))
(add-to-list 'interpreter-mode-alist '("python2.8" . python-mode)) ; it could happen

(add-to-list 'interpreter-mode-alist '("python3" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3.1" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3.2" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3.3" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3.4" . python-mode))

;; '#!this hashbang blah blah blah python' appears in many glacier ops tools python programs. 
;; tell emacs that this means python mode
(add-to-list 'interpreter-mode-alist '("this" . python-mode))

;; END OF LINE ;;
