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

(map! [f9]   'what-face
      ;; Essential
      ;; "M-;"  'eval-expression
      ;; "M-:"  'eval-region
      ;; "M-X"  'smex-major-mode-commands
      "M-X"  'smex
      "A-x"  'smex
      "A-X"  'smex-major-mode-commands
      "A-;"  'eval-expression
      ;; Tools
      "A-/"  'evil-commentary-line
      "M-/"  'evil-commentary-line
      "M-b"  'doom:build
      "C-`"  'doom/popup-last-buffer
      "M-~"  'doom/eshell
      ;; Text-scaling
      "M-0"  (λ! (text-scale-set 0))
      "M-="  'text-scale-increase
      "M--"  'text-scale-decrease
      ;; Simple window navigation/manipulation
      "M-w"  'doom/close-window-or-tab
      "M-W"  'delete-frame
      "M-n"  'doom/new-buffer
      "M-N"  'doom/new-frame
      ;; Temporary escape into emacs mode
      [C-escape]    'evil-emacs-state
      :e [C-escape] 'evil-normal-state
      ;; Basic keys for emacs mode
      :e "h"    'evil-backward-char
      :e "j"    'evil-next-line
      :e "k"    'evil-previous-line
      :e "l"    'evil-forward-char
      :e "C-S-h"  'evil-window-left
      :e "C-S-j"  'evil-window-up
      :e "C-S-k"  'evil-window-down
      :e "C-S-l"  'evil-window-right
        "C-w"     'ace-window
      ;; Switching tabs (workgroups)
      :m "C-1"  (λ! (doom:switch-to-tab 0))
      :m "C-2"  (λ! (doom:switch-to-tab 1))
      :m "C-3"  (λ! (doom:switch-to-tab 2))
      :m "C-4"  (λ! (doom:switch-to-tab 3))
      :m "C-5"  (λ! (doom:switch-to-tab 4))
      :m "C-6"  (λ! (doom:switch-to-tab 5))
      :m "C-7"  (λ! (doom:switch-to-tab 6))
      :m "C-8"  (λ! (doom:switch-to-tab 7))
      :m "C-9"  (λ! (doom:switch-to-tab 8))

      [M-backspace]       'doom/backward-kill-to-bol-and-indent
      [A-left]            'backward-word
      [A-right]           'forward-word
      "A-SPC"             'just-one-space
      "M-a"               'mark-whole-buffer
      "M-c"               'evil-yank
      "M-q"               'save-buffers-kill-emacs
      "M-s"               'save-buffer
      "M-v"               'clipboard-yank
      "M-z"               'undo
      "M-Z"               'redo
      "C-M-f"             'doom/toggle-fullscreen
      :m  "A-j"           'doom/multi-next-line
      :m  "A-k"           'doom/multi-previous-line
      :n  "M-r"           'doom:eval-buffer
      :v  "M-r"           'doom:eval-region
      :ni [M-f1]          'doom:docs-lookup
      ;; Textmate-esque indent shift left/right
      :i  "M-]"           'doom/smart-indent
      :i  "M-["           'doom/dumb-dedent
      ;; Restore osx text objects
      :i  [A-backspace]   'evil-delete-backward-word
      :i  [A-delete]      'doom/delete-forward-word

      ;;; <leader> and <localleader>
      :m ";" 'evil-ex
      (:leader
        :nv ","   'doom/ivy-switch-project-buffer ; or 'helm-buffers-list
        :nv "<"   'doom/ivy-switch-buffer         ; or 'helm-mini
        :nv "."   (@find-file-in default-directory)
        :nv "/"   (@find-file-in (doom/project-root) t)
        :nv ">"   'projectile-find-file-in-known-projects
        :n  ":"   'imenu-list-minor-mode          ; or 'helm-semantic-or-imenu
        :nv ";"   'counsel-imenu
        :v  "="   'align-regexp
        :nv "a"   'projectile-find-other-file
        :n  "b"   'counsel-bookmark               ; or 'helm-bookmarks
        :n  "B"   'bookmark-delete
        :n  "e"   'doom/flycheck-errors
        :n  "k"   'doom:docs-lookup
        :nv "l"   'doom/nlinum-toggle
        :nv "m"   'counsel-recentf                ; or 'helm-recentf
        :nv "M"   'projectile-recentf
        :nv "p"   'counsel-yank-pop
        :nv "P"   'counsel-projectile-switch-project ; or 'helm-projectile-switch-project
        :n  "r"   'emr-show-refactor-menu
        :n  "R"   'doom/reset-theme
        :n  "s"   'yas-visit-snippet-file
        :n  "S"   'doom/yas-find-file
        ;; Quick quitting
        :nv "Q"   'evil-save-and-quit
        :nv "C-q" 'doom/kill-workgroup-and-quit
        ;; Quick access to config files
        :nv "E"   (@find-file-in doom-emacs-dir t)
        :nv "\\"  (@find-file-in (f-expand ".dotfiles" "~") t)
        ;; Alternative to C-h (used as window shortcut)
        :n  "h"   'help-command
        (:prefix "d" ; <diff>
          :n "." 'doom/vcs-show-hunk
          :n "/" 'vc-diff
          :n "d" 'magit-status
          :n "D" 'git-messenger:popup-message
          :n "s" 'doom/vcs-stage-hunk
          :v "s" 'magit-stage
          :v "S" 'magit-stage
          :n "r" 'doom/vcs-revert-hunk
          :n "A" 'vc-annotate)
        (:prefix "t" ; <tmux>
          :n "." 'doom/tmux-cd-to-here
          :n "/" 'doom/tmux-cd-to-project
          :v "r" 'doom:tmux)
        (:prefix "o" ; <os>
          :n "o" 'os-open-in-default-program
          :n "r" 'os-reveal
          :n "p" 'os-reveal-project
          :n "b" 'os-open-in-browser
          :n "u" 'os-upload
          :n "U" 'os-upload-folder
          :n "t" 'os-switch-to-term
          :n "T" 'os-switch-to-term-and-cd
          (:when IS-MAC
            :n "l" 'os-send-to-launchbar
            :n "L" 'os-send-project-to-launchbar))
        (:prefix "x" ; <org>
          :n "x" 'doom/org
          :n "." (@find-file-in org-directory)
          :n "/" (@find-file-in org-directory t)
          :n "e" (@find-file-in org-export-directory)))

      (:localleader
        :n "\\" 'doom/neotree
        :n "b"  'doom:build
        :n "R"  'doom:repl
        :v "R"  'doom:repl-eval)

      ;;; Evil-esque bindings
      ;; Yank to EOL
      :n  "Y"   "y$"
      ;; Don't move cursor on indent
      :n  "="  'doom/static-reindent
      :v  "="  'evil-indent
      ;; Folding
      :n  "zr" 'doom/evil-open-folds
      :n  "zm" 'doom/evil-close-folds
      :n  "zx" 'doom/kill-real-buffer
      ;; Buffers
      :n  "ZX" 'bury-buffer
      :n  "]b" 'doom/next-real-buffer
      :n  "[b" 'doom/previous-real-buffer
      ;; Diffs
      :m  "]d" 'doom/vcs-next-hunk
      :m  "[d" 'doom/vcs-prev-hunk
      :m  "]e" 'doom/flycheck-next-error
      :m  "[e" 'doom/flycheck-previous-error
      ;; Switch tabs
      :n  "]w" 'doom:switch-to-workgroup-right
      :n  "[w" 'doom:switch-to-workgroup-left
      :m  "gt" 'doom:switch-to-workgroup-right
      :m  "gT" 'doom:switch-to-workgroup-left
      ;; Increment/decrement number under cursor
      :n  "g=" 'evil-numbers/inc-at-pt
      :n  "g-" 'evil-numbers/dec-at-pt
      :n  "gf" 'find-file-at-point
      ;; Navigation
      :nv "K"  'smart-up
      :m  "gD" 'doom/find-def
      :n  "gp" 'doom/reselect-paste
      :n  "gc" 'evil-commentary
      :n  "gx" 'evil-exchange
      :n  "gr" 'doom:eval-region
      :n  "gR" 'doom:eval-buffer
      :v  "gR" 'doom:eval-region-and-replace
      :m  "g]" 'smart-forward
      :m  "g[" 'smart-backward
      :v  "@"  'doom/evil-macro-on-all-lines
      :n  "g@" 'doom/evil-macro-on-all-lines
      ;; Repeat in visual mode
      :v  "."  'evil-repeat
      ;; vnoremap < <gv
      :v  "<"  (λ! (evil-shift-left (region-beginning) (region-end))
                   (evil-normal-state)
                   (evil-visual-restore))
      ;; vnoremap > >gv
      :v  ">"  (λ! (evil-shift-right (region-beginning) (region-end))
                   (evil-normal-state)
                   (evil-visual-restore))
      ;; undo/redo for regions (NOTE: Buggy!)
      :nv "u"   'undo-tree-undo
      :nv "C-r" 'undo-tree-redo
      ;; paste from recent yank register (which isn't overwritten)
      :v  "C-p" "\"0p"

    (:map evil-window-map ; prefix "C-w"
        ;; Navigation
        "C-S-h"     'evil-window-left
        "C-S-j"     'evil-window-up
        "C-S-k"     'evil-window-down
        "C-S-l"     'evil-window-right
        "C-w"     'ace-window
        ;; Swapping windows
        "H"       'doom/evil-window-move-l
        "J"       'doom/evil-window-move-u
        "K"       'doom/evil-window-move-d
        "L"       'doom/evil-window-move-r
        "C-S-w"   (λ! (ace-window 4))
        ;; Window undo/redo
        "u"       'doom/undo-window-change
        "C-u"     'doom/undo-window-change
        "C-r"     'doom/redo-window-change
        ;; Delete window
        "C-C"     (λ! (ace-window 16)))

      ;;; Plugins
      ;; evil-visual-star
      :v  "*"   'evil-visualstar/begin-search-forward
      :v  "#"   'evil-visualstar/begin-search-backward

      ;; evil-multiedit
      :v  "R"     'evil-multiedit-match-all
      :n  "M-C-D" 'evil-multiedit-restore
      :n  "M-d"   'evil-multiedit-match-symbol-and-next
      :n  "M-D"   'evil-multiedit-match-symbol-and-prev
      :v  "M-d"   'evil-multiedit-match-and-next
      :v  "M-D"   'evil-multiedit-match-and-prev

      ;; evil-surround
      :v  "S"   'evil-surround-region
      :o  "s"   'evil-surround-edit
      :o  "S"   'evil-Surround-edit

      ;; expand-region
      :v  "v"   'er/expand-region
      :v  "V"   'er/contract-region

      ;; evil-matchit
      :m  "%"   'evilmi-jump-items

      ;; hide-show/evil-matchit
      :m  "<tab>" 'doom/evil-matchit
      ;; rotate-text
      :n  "!"     'rotate-text

      ;; auto-yasnippet
      :i  "<C-tab>" 'aya-expand
      :nv "<C-tab>" 'aya-create

      ;; yasnippet
      (:after yasnippet
        (:map yas-minor-mode-map
          :i [tab] 'yas-expand
          :v [tab] 'doom/yas-insert-snippet))

      ;; company-mode and vim-like omni-complete
      :i "C-SPC" 'doom/company-complete
      (:prefix "C-x"
        :i "C-l"   'doom/company-whole-lines
        :i "C-k"   'doom/company-dict-or-keywords
        :i "C-f"   'company-files
        :i "C-]"   'company-tags
        :i "s"     'company-ispell
        :i "C-s"   'company-yasnippet
        :i "C-o"   'company-capf
        :i "C-n"   'company-dabbrev-code
        :i "C-p"   (λ! (let ((company-selection-wrap-around t))
                         (call-interactively 'company-dabbrev-code)
                         (company-select-previous-or-abort))))

      (:after company
        (:map company-active-map
          "C-o"        'company-search-kill-others
          "C-n"        'company-select-next
          "C-p"        'company-select-previous
          "C-h"        'company-quickhelp-manual-begin
          "C-S-h"      'company-show-doc-buffer
          "C-S-s"      'company-search-candidates
          "C-s"        'company-filter-candidates
          "C-SPC"      'company-complete-common-or-cycle
          [tab]        'doom/company-complete-common-or-complete-full
          [backtab]    'company-select-previous
          [escape]     (λ! (company-abort) (evil-normal-state 1))
          [C-return]   'counsel-company)
        (:map company-search-map
          "C-n"        'company-search-repeat-forward
          "C-p"        'company-search-repeat-backward
          [escape]     'company-search-abort))

      ;; help-mode
      (:after help-mode
        (:map help-map
          "e" 'doom/popup-messages)
        (:map help-mode-map
          :n "]]"  'help-go-forward
          :n "[["  'help-go-back
          :n "o"   'ace-link-help))

      ;;; Insert mode hacks
      ;; Textmate-esque newlines
      :i [backspace]    'delete-backward-char
      :i [M-backspace]  'doom/backward-kill-to-bol-and-indent
      :i [C-return]     (λ! (evil-open-below 1))
      ;; Emacsien motions for insert mode
      :i "C-b" 'backward-word
      :i "C-f" 'forward-word
      ;; escape from insert mode (more responsive than using key-chord-define)
      :irv "C-g" 'evil-normal-state)


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


;;
;;   | TAB/WORKGROUP | [ M-A-... ]   |
;;   | FRAME         | [ A-C-M-... ] |
;;   | WINDOW        | [ C-A-... ]   |
;;   | BUFFER        | [ C-b ... ]   |
;;

;;        FRAME  [ A-C-M-... ]
;;
;;
;; min/max/full
(global-set-key (kbd "A-C-M-\\")                            (λ! (toggle-max-frame-vertically)))
(global-set-key (kbd "A-C-M--")                             (λ! (toggle-max-frame-horizontally)))
;; (global-set-key (kbd "<A-C-M-return>")                      (toggle-frame-fullscreen))
(global-set-key (kbd "<A-C-M-return>")                      (λ! (toggle-frame-fullscreen)))
;; split
;; (global-set-key (kbd "A-C-M--")                             'split-frame-horizontally)
;; (global-set-key (kbd "A-C-M-\\")                            'split-frame-vertically)
;; resize frame
(global-set-key (kbd "A-C-M-<home>")                        (λ! (shrink-frame-horizontally 14)))
(global-set-key (kbd "A-C-M-<end>")                         (λ! (enlarge-frame-horizontally 14)))
(global-set-key (kbd "A-C-M-<prior>")                       (λ! (shrink-frame 7)))
(global-set-key (kbd "A-C-M-<next>")                        (λ! (enlarge-frame 7)))
;; move frame
(global-set-key (kbd "A-C-M-<left>")                        (λ! (move-frame-left 10)))
(global-set-key (kbd "A-C-M-<right>")                       (λ! (move-frame-right 10)))
(global-set-key (kbd "A-C-M-<up>")                          (λ! (move-frame-up 8)))
(global-set-key (kbd "A-C-M-<down>")                        (λ! (move-frame-down 8)))
;; -- micro
(global-set-key (kbd "A-C-M-S-<home>")                      (λ! (shrink-frame-horizontally 2)))
(global-set-key (kbd "A-C-M-S-<end>")                       (λ! (enlarge-frame-horizontally 2)))
(global-set-key (kbd "A-C-M-S-<prior>")                     (λ! (shrink-frame 1)))
(global-set-key (kbd "A-C-M-S-<next>")                      (λ! (enlarge-frame 1)))
(global-set-key (kbd "A-C-M-S-<left>")                      (λ! (move-frame-left 2)))
(global-set-key (kbd "A-C-M-S-<right>")                     (λ! (move-frame-right 2)))
(global-set-key (kbd "A-C-M-S-<up>")                        (λ! (move-frame-up 1)))
(global-set-key (kbd "A-C-M-S-<down>")                      (λ! (move-frame-down 1)))
;; transparency
(global-set-key (kbd "A-C-M-[")                             (λ! (decrease-frame-transparency 15)))
(global-set-key (kbd "A-C-M-]")                             (λ! (increase-frame-transparency 15)))

;;        TAB/WORKGROUP [ M-A-... ]
;;
(global-set-key (kbd "<M-A-home>")                          (λ! (doom:switch-to-tab 0)
                                                                (doom/tab-display)))
(global-set-key (kbd "<M-A-end>")                           (λ! (doom:switch-to-tab-last)
                                                                (doom/tab-display)))
(global-set-key (kbd "M-A-<prior>")                         (λ! (wg-switch-to-workgroup-left)
                                                                (doom/tab-display)))
(global-set-key (kbd "M-A-<next>")                          (λ! (wg-switch-to-workgroup-right)
                                                                (doom/tab-display)))
(global-set-key (kbd "<M-A-f13>")                           'doom/tab-display)
(global-set-key (kbd "<help>")                               nil)
(global-set-key (kbd "<M-A-help>")                          'doom:tab-create)
(global-set-key (kbd "<M-A-delete>")                        'doom:kill-tab)

;;        WINDOW [ C-A-... ]
;;
;; delete
(global-set-key (kbd "<C-A-backspace>")                      'remove-window)

;; split
(global-set-key (kbd "C-A-\\")                               'split-window-horizontally)
(global-set-key (kbd "C-A--")                                'split-window-vertically)
;; resize
(global-set-key (kbd "C-A-<home>")                           (λ! (shrink-window-horizontally 10)))
(global-set-key (kbd "C-A-<end>")                            (λ! (enlarge-window-horizontally 10)))
(global-set-key (kbd "C-A-<prior>")                          (λ! (shrink-window 7)))
(global-set-key (kbd "C-A-<next>")                           (λ! (enlarge-window 7)))
;; move frame
(global-set-key (kbd "C-A-<left>")                           (λ! (doom/evil-window-resize-l 10)))
(global-set-key (kbd "C-A-<right>")                          (λ! (doom/evil-window-resize-r 10)))
(global-set-key (kbd "C-A-<up>")                             (λ! (doom/evil-window-resize-u 4)))
(global-set-key (kbd "C-A-<down>")                           (λ! (doom/evil-window-resize-d 4)))
;; -- micro
(global-set-key (kbd "C-A-S-<home>")                         (λ! (shrink-window-horizontally 2)))
(global-set-key (kbd "C-A-S-<end>")                          (λ! (enlarge-window-horizontally 2)))
(global-set-key (kbd "C-A-S-<prior>")                        (λ! (shrink-window 1)))
(global-set-key (kbd "C-A-S-<next>")                         (λ! (enlarge-window 1)))
(global-set-key (kbd "C-A-S-<left>")                         (λ! (doom/evil-window-resize-l 10)))
(global-set-key (kbd "C-A-S-<right>")                        (λ! (doom/evil-window-resize-r 10)))
(global-set-key (kbd "C-A-S-<up>")                           (λ! (doom/evil-window-resize-u 4)))
(global-set-key (kbd "C-A-S-<down>")                         (λ! (doom/evil-window-resize-d 4)))

;;        BUFFER [ C-b ... ]
;;
(global-set-key (kbd "C-b")                                  nil)
(global-set-key (kbd "C-b <C-home>")                         'beginning-of-buffer)
(global-set-key (kbd "C-b <C-end>")                          'end-of-buffer)
(global-set-key (kbd "C-b <left>")                           'previous-buffer)
(global-set-key (kbd "C-b <right>")                          'next-buffer)
(global-set-key (kbd "C-b <deletechar>")                     'kill-this-buffer)
(global-set-key (kbd "C-x K")                                'kill-this-buffer)

(global-set-key (kbd "C-b p")                                'doom/ivy-switch-project-buffer)
(global-set-key (kbd "C-b g")                                'ivy-switch-buffer)


;; ===========================================
;; -------------------------------------------
;; -------- DEVELOPMENT IN PROGRESS ----------
;; -------------------------------------------
;; ===========================================


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

(progn
  (neotree-show)
  (setq-local tab-width 1)
)

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


