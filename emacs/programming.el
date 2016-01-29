;; Tabs be evil
(setq-default indent-tabs-mode nil)

;; Most modes should pick this up
(setq-default tab-width 4)

;; (global-set-key (kbd "ESC <up>") 'hs-toggle-hiding)
;; (global-set-key (kbd "ESC <down>") 'hs-show-all)

;; For modes with less advanced tab handling (fundamental is the usual culprit for me)
;;(setq tab-stop-list (number-sequence 4 120 4))

(defun py-outline-level ()
  (let (buffer-invisibility-spec)
    (save-excursion
      (skip-chars-forward "\t ")
      (current-column)))
)

(defun hide-body-recenter ()
  (interactive)
  (hide-body)
  (recenter)
)

(defun my-pythonFold-hook ()
  (setq outline-regexp "[^ \t\n]\\|[ \t]*\\(def[ \t]+\\|class[ \t]+\\)")
  (setq outline-level 'py-outline-level)
  (outline-minor-mode t)
  ;; in iterm2, all of these are send esc sequcnce, [a, [b, [c, [d
  (define-key python-mode-map (kbd "M-[ a") 'hide-subtree)         ;; alt-left
  (define-key python-mode-map (kbd "M-[ b") 'show-subtree)         ;; alt-right
  (define-key python-mode-map (kbd "M-[ c") 'show-all)             ;; alt-up
  (define-key python-mode-map (kbd "M-[ d") 'hide-body-recenter)   ;; alt-down
)

(add-hook 'python-mode-hook 'my-pythonFold-hook)

;; END OF LINE ;;
