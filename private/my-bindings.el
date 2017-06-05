;;; my-bindings.el

(eval-when-compile (require 'core-defuns))

(defmacro @find-file-in (path &optional project-p)
  "Returns a interactive function for searching files"
  `(lambda () (interactive)
     (let ((default-directory ,path))
       (,@(if project-p
              '(counsel-projectile-find-file)
            '(call-interactively 'counsel-find-file)
            )))))


(global-set-key (kbd "<f11>")                               nil)
(global-set-key (kbd "<delete>")                            nil) ;; Remove the old keybinding
(global-set-key (kbd "<delete>")                            'org-delete-char)

(global-set-key (kbd "M-;")                                 nil)
(global-set-key (kbd "M-;")                                 'eval-expression)

(global-set-key (kbd "M-:")                                 nil)
(global-set-key (kbd "M-:")                                 'eval-region)

(global-set-key (kbd "A-:")                                 'eval-region)
(global-set-key (kbd "A-;")                                 'eval-expression)

(global-set-key (kbd "M-x")                                 nil)
(global-set-key (kbd "M-x")                                 'clipboard-kill-region)

(global-set-key (kbd "M-X")                                 nil)
(global-set-key (kbd "M-X")                                 'helm-M-x)

(global-set-key (kbd "A-x")                                 'helm-M-x)
(global-set-key (kbd "A-X")                                 'smex)

(global-set-key (kbd "C-x p")                               'helm-M-x)
(global-set-key (kbd "C-x P")                               'smex)

(defun customize-option-with-input-str ()
  "Show all options matching input string."
  (interactive)
    (let ((x (read-string "Options matching pattern: ")))
      (customize-apropos-options x)
    )
  )
(global-set-key (kbd "C-h x")                               'customize-option-with-input-str)

;; TODO expand handling of indent/dedent fx to include (in addition to cursor point), moving selected regions
(global-set-key (kbd "<C-tab>")                             (λ! (insert "    ")))
(global-set-key (kbd "<C-S-tab>")                           (λ! (delete-char 4)))
(global-set-key (kbd "A-c f")                               'doom/org-toggle-fold)
(global-set-key (kbd "A-c <up>")                            'move-text-line-up)
(global-set-key (kbd "A-c <down>")                          'move-text-line-down)
(global-set-key (kbd "A-c <C-up>")                          'move-text-region-up)
(global-set-key (kbd "A-c <C-down>")                        'move-text-region-down)
;; (global-set-key (kbd "A-c <C-down>")                        (λ! (move-text-region-down)
;;                                                                 (insert "
;; ")))
(global-set-key (kbd "C-c a")                               'org-table-align)
;; (global-set-key [f8] 'neotree-toggle)

(global-set-key [f8]                                        'neotree-toggle)
(global-set-key (kbd "<S-f8>")                              'neotree-project-dir)
(global-set-key (kbd "<A-f8>")                              'neotree-refresh)
(global-set-key (kbd "<C-f8>")                              'sr-speedbar-toggle)
;; (global-set-key [f8]                        (λ! (neotree-toggle) (setq-local tab-width 1)(refresh)))
;;                                                                  (enlarge-frame-horizontally 10)))

;; (global-set-key (kbd "<S-mouse-1>")                         nil)
;; (global-set-key (kbd "<S-up-mouse-1>")                      nil)
(global-set-key (kbd "<S-down-mouse-1>")                    nil)
(global-set-key (kbd "<S-down-mouse-1>")                    'mc/add-cursor-on-click)     ;; 'ace-mc-add-multiple-cursors)
(global-set-key (kbd "<C-down-mouse-1>")                    nil)
(global-set-key (kbd "<C-down-mouse-1>")                    'multiple-cursors-mode)
;; (global-set-key (kbd "C-C")                                 nil)
(global-set-key (kbd "C-C d")                               'mc/remove-current-cursor)
(global-set-key (kbd "C-C D")                               'mc/remove-duplicated-cursors)
(global-set-key (kbd "C-w")                                 nil)
(global-set-key (kbd "C-w C-q <down-mouse-1>")              'mouse-remove-window)
(global-set-key (kbd "C-w C-w <down-mouse-1>")              'tear-off-window)


;;  I    | FRAME         | [ A-C-M-... ] |
;;  II   | TAB/WORKGROUP | [ M-A-... ]   |
;;  III  | WINDOW        | [ C-A-... ]   |
;;  IV   | BUFFER        | [ C-b ... ]   |


;;  I    | FRAME  [ A-C-M-... ]
(global-set-key (kbd "A-C-M-\\")                            'toggle-max-frame-vertically)                         ;; MIN/MAX/FULL SCREEN
(global-set-key (kbd "A-C-M--")                             'toggle-max-frame-horizontally)                       ;;     (for `split` --> see Window)
(global-set-key (kbd "<f11>")                            	nil)
(global-set-key (kbd "<S-f11>")                         	nil)
(global-set-key (kbd "<A-C-M-return>")                      'toggle-frame-fullscreen)
(global-set-key (kbd "A-C-M-<home>")                        (λ! (shrink-frame-horizontally 14)))                        ;; RESIZE
(global-set-key (kbd "A-C-M-<end>")                         (λ! (enlarge-frame-horizontally 14)))
(global-set-key (kbd "A-C-M-<prior>")                       (λ! (shrink-frame 7)))
(global-set-key (kbd "A-C-M-<next>")                        (λ! (enlarge-frame 7)))
(global-set-key (kbd "A-C-M-S-<home>")                      (λ! (shrink-frame-horizontally 2)))                         ;; RESIZE (micro)
(global-set-key (kbd "A-C-M-S-<end>")                       (λ! (enlarge-frame-horizontally 2)))
(global-set-key (kbd "A-C-M-S-<prior>")                     (λ! (shrink-frame 1)))
(global-set-key (kbd "A-C-M-S-<next>")                      (λ! (enlarge-frame 1)))
(global-set-key (kbd "A-C-M-<left>")                        (λ! (move-frame-left 10)))                                  ;; MOVE
(global-set-key (kbd "A-C-M-<right>")                       (λ! (move-frame-right 10)))
(global-set-key (kbd "A-C-M-<up>")                          (λ! (move-frame-up 8)))
(global-set-key (kbd "A-C-M-<down>")                        (λ! (move-frame-down 8)))
(global-set-key (kbd "A-C-M-S-<left>")                      (λ! (move-frame-left 2)))                                   ;; MOVE (micro)
(global-set-key (kbd "A-C-M-S-<right>")                     (λ! (move-frame-right 2)))
(global-set-key (kbd "A-C-M-S-<up>")                        (λ! (move-frame-up 1)))
(global-set-key (kbd "A-C-M-S-<down>")                      (λ! (move-frame-down 1)))
(global-set-key (kbd "A-C-M-[")                             (λ! (decrease-frame-transparency 15)))                      ;; TRANSPARENCY
(global-set-key (kbd "A-C-M-]")                             (λ! (increase-frame-transparency 15)))

;;  II    | TAB/WORKGROUP [ M-A-... ]
(global-set-key (kbd "<M-A-home>")                          (λ! (doom:switch-to-tab 0)(doom/tab-display)) )             ;; NAVIGATE INSTANCES
(global-set-key (kbd "<M-A-end>")                           (λ! (doom:switch-to-tab-last)(doom/tab-display)) )
(global-set-key (kbd "M-A-<prior>")                         (λ! (wg-switch-to-workgroup-left)(doom/tab-display)) )
(global-set-key (kbd "M-A-<next>")                          (λ! (wg-switch-to-workgroup-right)(doom/tab-display)) )
(global-set-key (kbd "<help>")                               nil)
(global-set-key (kbd "<M-A-help>")                          'doom:tab-create)                                           ;; CREATE/SHOW/DESTROY
(global-set-key (kbd "<M-A-f13>")                           'doom/tab-display)
(global-set-key (kbd "<M-A-delete>")                        'doom:kill-tab)

;;  III   | WINDOW [ C-A-... ]
(global-set-key (kbd "C-A-<left>")                           'window-jump-left)                                         ;; NAVIGATE INSTANCES
(global-set-key (kbd "C-A-<right>")                          'window-jump-right)
(global-set-key (kbd "C-A-<up>")                             'window-jump-up)
(global-set-key (kbd "C-A-<down>")                           'window-jump-down)
(global-set-key (kbd "<C-A-delete>")                         'remove-window)                                            ;; DELETE/SPLIT
(global-set-key (kbd "C-A-\\")                               'split-window-horizontally)
(global-set-key (kbd "C-A--")                                'split-window-vertically)
(global-set-key (kbd "C-A-<home>")                           (λ! (shrink-window-horizontally 10)))                      ;; RESIZE
(global-set-key (kbd "C-A-<end>")                            (λ! (enlarge-window-horizontally 10)))
(global-set-key (kbd "C-A-<prior>")                          (λ! (shrink-window 7)))
(global-set-key (kbd "C-A-<next>")                           (λ! (enlarge-window 7)))
(global-set-key (kbd "C-A-S-<home>")                         (λ! (shrink-window-horizontally 2)))                       ;; RESIZE (micro)
(global-set-key (kbd "C-A-S-<end>")                          (λ! (enlarge-window-horizontally 2)))
(global-set-key (kbd "C-A-S-<prior>")                        (λ! (shrink-window 1)))
(global-set-key (kbd "C-A-S-<next>")                         (λ! (enlarge-window 1)))

;;  IV    | BUFFER [ C-b ... ]
(global-set-key (kbd "C-b")                                  nil)
(global-set-key (kbd "C-b <C-home>")                         'beginning-of-buffer)                                      ;; NAVIGATE CONTENT
(global-set-key (kbd "C-b <C-end>")                          'end-of-buffer)
(global-set-key (kbd "C-b <left>")                           'previous-buffer)                                          ;; NAVIGATE INSTANCES
(global-set-key (kbd "C-b <right>")                          'next-buffer)
(global-set-key (kbd "C-b g")                                'ivy-switch-buffer)
(global-set-key (kbd "C-b <help>")                           'scratch-pop)                                              ;; CREATE/SHOW/DESTROY
(global-set-key (kbd "C-b <f13>")                            'list-buffers)
(global-set-key (kbd "C-b <deletechar>")                     'kill-this-buffer)
(global-set-key (kbd "C-x K")                                'kill-this-buffer)

;; PROJECTS
(global-set-key (kbd "C-b p")                                'doom/ivy-switch-project-buffer)                           ;;


;; ===========================================
;; -------------------------------------------
;; -------- DEVELOPMENT IN PROGRESS ----------
;; -------------------------------------------
;; ===========================================

;; (progn
;;   (neotree-show)
;;   (setq-local tab-width 1)
;; )


;; KEEP
;;


;; NOTES
;;
;;
;; cancel multi-cursor if active else ...(with ctrl-clicking) :EMACS::CURSOR::SETTINGS:
;; learn text selection via emacs' `mark` method
;;
;; sets mark A at cursor
;; set mark B at point
;; selects A:B



;; ===========================================
;; ===========================================
;; ===========================================

;; (global-set-key (kbd "C-M-A-S-<left>")                       (λ! (move-frame-left 10)
;;                                                                  (enlarge-frame-horizontally 10)))

;;(define-key ivy-minibuffer-map (kbd "<wheel-up>") 'ivy-previous-line)
;;(define-key ivy-minibuffer-map (kbd "<wheel-down>") 'ivy-next-line)
;;(define-key info (kbd "<wheel-up>") 'ivy-previous-line)
;;(define-key info (kbd "<wheel-down>") 'ivy-next-line)

;;ivy-switch-buffer-other-window
;;ivy-gitlab-list-projects
;;(global-set-key (kbd "C-c x") 'clipboard-kill-region)
;;(global-set-key (kbd "C-c c") 'clipboard-kill-ring-save)
;;(global-set-key (kbd "C-c v") 'clipboard-yank)


;; ===========================================
;; ===========================================


(provide 'my-bindings)
;;; my-bindings.el ends here
