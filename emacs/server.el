;; server mode customizations

; C-x c-s to save a file and c-x c-c to "exit" are 20 year old muscle memory by now.
; But in server mode, I want c-x c-c to be "server-edit"

; So, reverse the functions bound to c-x c-c and c-x #
; I'm sure this will blow up on me at some point.

(global-set-key (kbd "C-x %") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'server-edit)

; Tramp mode
(setq tramp-default-method "mosh")

;; (defun maybe-delete-frame-buffer (frame)
;;   "When a dedicated FRAME is deleted, also kill its buffer.
;; A dedicated frame contains a single window whose buffer is not
;; displayed anywhere else."
;;   (let ((windows (window-list frame)))
;;     (when (eq 1 (length windows))
;;       (let ((buffer (window-buffer (car windows))))
;;         (when (eq 1 (length (get-buffer-window-list buffer nil t)))
;;           (kill-buffer buffer))))))
;; You can add it as a hook that gets called whenever a frame is closed using:

;; (add-to-list 'delete-frame-functions #'maybe-delete-frame-buffer)


;; END OF LINE ;;
