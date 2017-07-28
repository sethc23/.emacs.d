;;; my-bindings.el

(eval-when-compile (require 'core-defuns))

;; (defmacro @find-file-in (path &optional project-p)
;;   "Returns a interactive function for searching files"
;;   `(lambda () (interactive)
;;      (let ((default-directory ,path))
;;        (,@(if project-p
;;               '(counsel-projectile-find-file)
;;             '(call-interactively 'counsel-find-file)
;;             )))))

;; (global-set-key (kbd "C-c i")                               (lambda () (interactive) (find-file "~/.emacs.d/private/custom/index.org")))
(global-set-key (kbd "C-c b")                               (lambda () (interactive) (find-file "~/.emacs.d/private/org/bjournal/index.org")(split-window-right)))
(global-set-key (kbd "C-c <prior>")                         'back-button-global-backward)
(global-set-key (kbd "C-c <next>")                          'back-button-global-forward)

(global-set-key (kbd "C-M-r")                               'org-capture)
;;(global-set-key (kbd "C-M-r")                               'helm-org-capture-templates)

(global-set-key (kbd "<f9>")                                (lambda () (interactive) (load-file "~/.emacs.d/private/custom/hydras/custom-hydras.el")))
(global-set-key (kbd "<f11>")                               (lambda () (interactive) (load-file "~/.emacs.d/private/custom/hydras/custom-hydras.el")))

(global-set-key (kbd "C-S-<up>")                            nil)
(global-set-key (kbd "C-S-<up>")                            'move-region-up)
(global-set-key (kbd "C-S-<down>")                          'move-region-down)
(global-set-key (kbd "M-<up>")                              'move-line-up )
(global-set-key (kbd "M-<down>")                            'move-line-down )

(global-set-key (kbd "C-c 1")                               'org-store-link)
(global-set-key (kbd "C-c 2")                               'find-link-to-here)
(global-set-key (kbd "C-c 3")                               'org-insert-last-stored-link)
(global-set-key (kbd "C-x F")                               'find-function)

(global-set-key (kbd "C-c C-a s")                           'org-agenda-list)
(global-set-key (kbd "C-c C-x C-g")                         'org-clock-jump-to-current-clock)

(global-set-key (kbd "C-c C-x C-w")                         'org-cut-subtree)
(global-set-key (kbd "C-c C-x M-w")                         'org-copy-subtree)
(global-set-key (kbd "C-c C-x C-y")                         'org-paste-subtree)

(global-set-key (kbd "<f11>")                               nil)
(global-set-key (kbd "<delete>")                            nil) ;; Remove the old keybinding
(global-set-key (kbd "<delete>")                            'org-delete-char)

(global-set-key (kbd "M-;")                                 nil)
(global-set-key (kbd "M-;")                                 'eval-expression)
(global-set-key (kbd "A-M-;")                               nil)
(global-set-key (kbd "A-M-;")                               'eval-region)
;; (global-set-key (kbd "A-:")                                 'eval-region)
(global-set-key (kbd "C-M-;")                               'eval-buffer)

(global-set-key (kbd "C-M-!")                               'org-babel-execute-src-block)


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
(global-set-key (kbd "C-x P")                               'fold-this)
(global-set-key (kbd "C-x P")                               'fold-this-unfold-at-point)
(global-set-key (kbd "C-x P")                               'smex)

;;(global-set-key (kbd "A-c")                                 nil)
(global-set-key (kbd "M-f")                                 'doom/org-toggle-fold)
;;(global-set-key (kbd "A-c <up>")                            'move-text-line-up)
;;(global-set-key (kbd "A-c <down>")                          'move-text-line-down)
;;(global-set-key (kbd "A-c <C-up>")                          'move-text-region-up)
;;(global-set-key (kbd "A-c <C-down>")                        'move-text-region-down)
;; (global-set-key (kbd "A-c <C-down>")                        (λ! (move-text-region-down)
;;                                                                 (insert "
;; ")))
;;dedent

(global-set-key (kbd "M-z")                                 nil)
(global-set-key (kbd "M-z")                                 'undo-tree-undo)
(global-set-key (kbd "S-M-z")                               'undo-tree-redo)

(global-set-key (kbd "M-x")                                 nil)
(global-set-key (kbd "M-x")                                 'clipboard-kill-region)
(global-set-key (kbd "M-c")                                 nil)
(global-set-key (kbd "M-c")                                 'clipboard-kill-ring-save)
(global-set-key (kbd "M-v")                                 nil)
(global-set-key (kbd "M-v")                                 'clipboard-yank)


(defun kill-line-backward (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))
(global-set-key (kbd "C-S-k")                               'kill-line-backward)

(global-set-key (kbd "C-c C-f f")                           'org-refile)
(global-set-key (kbd "C-c C-f l")                           'org-refile-goto-last-stored)
(global-set-key (kbd "C-c C-f c")                           'my/org-refile-hydra/body)

(global-set-key (kbd "C-c e")                               'org-agenda)


(global-set-key (kbd "C-c e")                               'turn-off-evil-mode)


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
(global-set-key (kbd "A-C-M-S-\\")                          'restore-frame-vertically)
(global-set-key (kbd "A-C-M-S--")                           'restore-frame-horizontally)
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
(global-set-key (kbd "M-A-<insert>")                        'doom:tab-create)
(global-set-key (kbd "<M-A-f13>")                           'doom/tab-display)
(global-set-key (kbd "<M-A-delete>")                        'doom:kill-tab)

(global-set-key (kbd "C-t")                                 nil)
(global-set-key (kbd "C-t ?")                               'doom/tab-display)
(global-set-key (kbd "C-t k")                               'doom:kill-tab)
(global-set-key (kbd "C-t n")                               'doom:tab-create)
(global-set-key (kbd "C-t <left>")                          (λ! (wg-switch-to-workgroup-left)(doom/tab-display)) )
(global-set-key (kbd "C-t <right>")                         (λ! (wg-switch-to-workgroup-right)(doom/tab-display)) )
(global-set-key (kbd "C-t <up>")                            (λ! (doom:switch-to-tab 0)(doom/tab-display)) )
(global-set-key (kbd "C-t <down>")                          (λ! (doom:switch-to-tab-last)(doom/tab-display)) )

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

(global-set-key (kbd "C-c s")                                'yas-insert-snippet)

;; (setq org-capture-templates
;;       '(

;;         ("e" "Save Entry" entry (file+headline "~/org/seth.org" "UNFILED")
;;              "* %i\n:PROPERTIES: \n:CREATED: %T \n:SRC_FILE: [[file+emacs:%F][%f]] \n:SRC_LINK: %a\n:END:\n"
;;              :prepend t
;;              :clock-resume t
;;              :immediate-finish t
;;              )
;;        ("i" "Save Item" item (file+headline "~/org/seth.org" "UNFILED")
;;              "* [ ] %i\n:PROPERTIES: \n:CREATED: %T \n:SRC_FILE: [[file+emacs:%F][%f]] \n:SRC_LINK: %a\n:END:\n"
;;              :prepend t
;;              :clock-resume t
;;              :immediate-finish t
;;              )
;;         ("t" "Todo" checkitem (file+headline "~/org/seth.org" "UNFILED")
;;              "- [ ] %i \n%a\n[[_from][file+emacs:%f]]\n[[_to][file+emacs:%F]]\n(%T)\n" :prepend)
;;         ("j" "Journal" entry (file+datetree "~/org/journal.org")
;;              "* %?\nEntered on %U\n  %i\n  %a")
;;         )
;;     )

;; (map! [f9]   'what-face

;; 	;; Tools
;; 	"A-/"  'evil-commentary-line
;; 	"M-/"  'evil-commentary-line

;; 	;;"M-b"  'doom:build
;; 	"C-`"  'doom/popup-last-buffer
;; 	"M-~"  'doom/eshell

;; 	;; Text-scaling
;; 	"M-0"  (λ! (text-scale-set 0))
;; 	"M-="  'text-scale-increase
;; 	"M--"  'text-scale-decrease

;; 	;; Simple window navigation/manipulation
;; 	"M-w"  'doom/close-window-or-tab
;; 	"M-W"  'delete-frame
;; 	"M-n"  'doom/new-buffer
;; 	"M-N"  'doom/new-frame

;; 	;; Text Editing
;;     [A-left]            'backward-word
;; 	[A-right]           'forward-word
;; 	;;"A-SPC"             'just-one-space

;; 	"M-a"               'mark-whole-buffer
;; 	"M-c"               'evil-yank
;; 	"M-q"               'save-buffers-kill-emacs
;; 	"M-s"               'save-buffer
;; 	"M-v"               'clipboard-yank
;; 	"M-z"               'undo
;; 	"M-Z"               'redo
;; 	[M-f1]              'doom:docs-lookup

;; 	;; Textmate-esque indent shift left/right
;; 	:i  "M-]"           'doom/smart-indent
;; 	:i  "M-["           'doom/dumb-dedent

;; 	;; Restore osx text objects
;; 	:i  [A-backspace]   'evil-delete-backward-word
;; 	:i  [A-delete]      'doom/delete-forward-word

;; 	;;; <leader> and <localleader>
;; 	:m ";" 'evil-ex
;; 	(:leader
;; 	  :nv ","   'doom/ivy-switch-project-buffer ; or 'helm-buffers-list
;; 	  :nv "<"   'doom/ivy-switch-buffer         ; or 'helm-mini
;; 	  :nv "."   (@find-file-in default-directory)
;; 	  :nv "/"   (@find-file-in (doom/project-root) t)
;; 	  :nv ">"   'projectile-find-file-in-known-projects
;; 	  :n  ":"   'imenu-list-minor-mode          ; or 'helm-semantic-or-imenu
;; 	  :nv ";"   'counsel-imenu
;; 	  :v  "="   'align-regexp
;; 	  :nv "a"   'projectile-find-other-file
;; 	  :n  "b"   'counsel-bookmark               ; or 'helm-bookmarks
;; 	  :n  "B"   'bookmark-delete
;; 	  :n  "e"   'doom/flycheck-errors
;; 	  :n  "k"   'doom:docs-lookup
;; 	  :nv "l"   'doom/nlinum-toggle
;; 	  :nv "m"   'counsel-recentf                ; or 'helm-recentf
;; 	  :nv "M"   'projectile-recentf
;; 	  :nv "p"   'counsel-yank-pop
;; 	  :nv "P"   'counsel-projectile-switch-project ; or 'helm-projectile-switch-project
;; 	  :n  "r"   'emr-show-refactor-menu
;; 	  :n  "R"   'doom/reset-theme
;; 	  :n  "s"   'yas-visit-snippet-file
;; 	  :n  "S"   'doom/yas-find-file
;; 	  ;; Quick quitting
;; 	  :nv "Q"   'evil-save-and-quit
;; 	  :nv "C-q" 'doom/kill-workgroup-and-quit
;; 	  ;; Quick access to config files
;; 	  :nv "E"   (@find-file-in doom-emacs-dir t)
;; 	  :nv "\\"  (@find-file-in (f-expand ".dotfiles" "~") t)
;; 	  ;; Alternative to C-h (used as window shortcut)
;; 	  :n  "h"   'help-command
;; 	  (:prefix "d" ; <diff>
;; 	    :n "." 'doom/vcs-show-hunk
;; 	    :n "/" 'vc-diff
;; 	    :n "d" 'magit-status
;; 	    :n "D" 'git-messenger:popup-message
;; 	    :n "s" 'doom/vcs-stage-hunk
;; 	    :v "s" 'magit-stage
;; 	    :v "S" 'magit-stage
;; 	    :n "r" 'doom/vcs-revert-hunk
;; 	    :n "A" 'vc-annotate)
;; 	  (:prefix "t" ; <tmux>
;; 	    :n "." 'doom/tmux-cd-to-here
;; 	    :n "/" 'doom/tmux-cd-to-project
;; 	    :v "r" 'doom:tmux)
;; 	  (:prefix "o" ; <os>
;; 	    :n "o" 'os-open-in-default-program
;; 	    :n "r" 'os-reveal
;; 	    :n "p" 'os-reveal-project
;; 	    :n "b" 'os-open-in-browser
;; 	    :n "u" 'os-upload
;; 	    :n "U" 'os-upload-folder
;; 	    :n "t" 'os-switch-to-term
;; 	    :n "T" 'os-switch-to-term-and-cd
;; 	    (:when IS-MAC
;; 	      :n "l" 'os-send-to-launchbar
;; 	      :n "L" 'os-send-project-to-launchbar))
;; 	  (:prefix "x" ; <org>
;; 	    :n "x" 'doom/org
;; 	    :n "." (@find-file-in org-directory)
;; 	    :n "/" (@find-file-in org-directory t)
;; 	    :n "e" (@find-file-in org-export-directory)))

;; 	(:localleader
;; 	  :n "\\" 'doom/neotree
;; 	  :n "b"  'doom:build
;; 	  :n "R"  'doom:repl
;; 	  :v "R"  'doom:repl-eval)

;; 	;; Don't move cursor on indent
;; 	:n  "="  'doom/static-reindent
;; 	:v  "="  'evil-indent

;; 	;; Folding
;; 	:n  "zr" 'doom/evil-open-folds
;; 	:n  "zm" 'doom/evil-close-folds
;; 	:n  "zx" 'doom/kill-real-buffer

;; 	;; Navigation
;; 	:nv "K"  'smart-up
;; 	:m  "gD" 'doom/find-def
;; 	:n  "gp" 'doom/reselect-paste
;; 	:n  "gc" 'evil-commentary
;; 	:n  "gx" 'evil-exchange
;; 	:m  "g]" 'smart-forward
;; 	:m  "g[" 'smart-backward	;; undo/redo for regions (NOTE: Buggy!)
;; 	:nv "u"   'undo-tree-undo
;; 	:nv "C-r" 'undo-tree-redo

;;     ;; paste from recent yank register (which isn't overwritten)
;; 	:v  "C-p" "\"0p"

;; 	;; expand-region
;; 	:v  "v"   'er/expand-region
;; 	:v  "V"   'er/contract-region

;; 	;; auto-yasnippet
;; 	:i  "<C-tab>" 'aya-expand
;; 	:nv "<C-tab>" 'aya-create

;; 	;; yasnippet
;; 	(:after yasnippet
;; 	  (:map yas-minor-mode-map
;; 	    :i [tab] 'yas-expand
;; 	    :v [tab] 'doom/yas-insert-snippet))
;; 	)


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



;; ===========================================
;; ===========================================


(provide 'my-bindings)
;;; my-bindings.el ends here
