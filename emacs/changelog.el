
;; ======================
;; Insert Changelog line

(defun insert-changelog ()
  "insert a standardized (from rpm .spec files mostly) changelog line"
      (interactive)
      (insert (format-time-string "* %a %b %d %Y Hunter Matthews <hunter@mcs.anl.gov>" (current-time)))
;     (insert "\n")
)
(global-set-key [f2] 'insert-changelog)

