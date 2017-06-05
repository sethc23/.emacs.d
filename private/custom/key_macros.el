;;; key_macros.el --- description

(fset 'm_org-demote
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217787 40 111 114 103 45 100 111 45 100 101 109 111 116 101 41 return 24 11 110 111 114 103 45 100 101 109 111 116 101] 0 "%d")) arg)))
(fset 'm_org-promote
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217787 40 111 114 103 45 100 111 45 112 114 111 109 111 116 101 41 return] 0 "%d")) arg)))

(provide 'key_macros)
;;; key_macros.el ends here
