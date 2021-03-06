;;; defuns-util.el

;;;###autoload
(defun what-face (pos)
  "Tells you the name of the face (point) is on."
  (interactive "d")
  (let ((hl-line-p (bound-and-true-p hl-line-mode)))
    (if hl-line-p (hl-line-mode -1))
    (let ((face (or (get-char-property (point) 'read-face-name)
                    (get-char-property (point) 'face))))
      (if face (message "Face: %s" face) (message "No face at %d" pos)))
    (if hl-line-p (hl-line-mode 1))))

;;;###autoload
(defun what-col ()
  (interactive)
  (message "Column %d" (current-column)))

;;;###autoload
(defun what-bindings (key)
  (list
   (minor-mode-key-binding key)
   (local-key-binding key)
   (global-key-binding key)))

;;;###autoload
(defun what-major-mode ()
  (interactive)
  (message "Mode: %s" major-mode))

;;;###autoload (autoload 'doom:echo "defuns-util" nil t)
(evil-define-command doom:echo (bang message)
  "Display MSG in echo-area without logging it in *Messages* buffer."
  (interactive "<!><a>")
  (let (message-log-max)
    (message "%s%s" (if bang ">> " "") message)))

(provide 'defuns-util)
;;; defuns-util.el ends here
