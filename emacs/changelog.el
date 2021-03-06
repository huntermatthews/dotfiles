
;; ======================
;; Insert Changelog line

(defun insert-changelog ()
  "insert a standardized (from rpm .spec files mostly) changelog line"
      (interactive)
      (insert (format-time-string "* %a %b %d %Y Hunter Matthews <hunter.matthews@nih.gov> - @@VERSION-RELEASE@@" (current-time)))
      (insert "\n")
)

(defun insert-journal ()
  "insert a personalized date and timestamp kind of message"
  (interactive)
      (insert (format-time-string "%A %B %d, %Y at roughly %R. Hunter allegedly spewed forth:" (current-time)))
      (insert "\n")
)
(global-set-key [f2] 'insert-changelog)
(global-set-key [f3] 'insert-journal)
