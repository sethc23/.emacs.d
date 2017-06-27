;;; custom-org-babel-tangle-hooks.el --- description


;; Tangle Org files when we save them
(defun tangle-on-save-org-mode-file()
  (when (string= (message "%s" major-mode) "org-mode")
    (org-babel-tangle)))

(add-hook 'after-save-hook 'tangle-on-save-org-mode-file)

;; Enable the auto-revert mode globally. This is quite useful when you have
;; multiple buffers opened that Org-mode can update after tangling.
;; All the buffers will be updated with what changed on the disk.
(global-auto-revert-mode)

;; Add Org files to the agenda when we save them
(defun to-agenda-on-save-org-mode-file()
  (when (string= (message "%s" major-mode) "org-mode")
    (org-agenda-file-to-front)))

(add-hook 'after-save-hook 'to-agenda-on-save-org-mode-file)

;; make sure that when we export in HTML, that we don't export with inline css.
;; that way the CSS of the HTML theme will be used instead which is better
(setq org-html-htmlize-output-type 'css)

(provide 'custom-org-babel-tangle-hooks)
;;; custom-org-babel-tangle-hooks.el ends here
