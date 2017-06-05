;;; module-org.el --- -*- no-byte-compile: t; -*-

;; A few things you can expect
;;   + `org-capture' in a popup frame (can be invoked from outside emacs too)
;;   + A simpler attachment system (with auto-deleting support) and
;;     drag-and-drop for images and documents into org files
;;   + Exported files are put in a centralized location (see
;;     `org-export-directory')
;;   + TODO Custom links for class notes
;;   + TODO An org-mode based CRM (including invoicing and pdf exporting) (see custom-crm)
;;   + TODO A tag-based file browser reminiscient of Evernote and Quiver (there's neotree too!)

(define-minor-mode evil-org-mode
  "Evil-mode bindings for org-mode."
  :init-value nil
  :lighter " !"
  :keymap (make-sparse-keymap)
  :group 'evil-org)

(add-hook 'org-load-hook 'doom|org-init t)
(add-hook 'org-load-hook 'doom|org-init-attach t)
(add-hook 'org-load-hook 'doom|org-init-export t)
(add-hook 'org-load-hook 'doom|org-init-capture t)
(add-hook 'org-load-hook 'doom|org-hacks t)
(add-hook 'org-mode-hook 'doom|org-hook)

;; Custom variables
(defvaralias 'org-directory 'doom-org-dir)

(defvar doom-org-notes-dir (f-expand "notes" doom-org-dir)
  "The directory where the notes are kept")

(defvar doom-org-quicknote-dir (f-expand "inbox" doom-org-dir)
  "The directory to store quick notes produced by `doom:org-capture' (individual org files)")

(defvar doom-org-attachment-dir ".attach/"
  "Where to store attachments (relative to current org file).")

(defvar-local doom-org-attachments-list '()
  "A list of attachments for the current buffer. This is so my custom attachment
system can keep track of each buffer's attachments.")


;;
(defun doom|org-hook ()
  "Run everytime `org-mode' is enabled."
  (evil-org-mode +1)
  (visual-line-mode +1)
  (setq line-spacing 1)

  ;; If saveplace places the point in a folded position, unfold it on load
  (when (outline-invisible-p)
    (ignore-errors
      (save-excursion
        (outline-previous-visible-heading 1)
        (org-show-subtree))))

  (defun doom|org-update ()
    (when (file-exists-p buffer-file-name)
      (org-update-statistics-cookies t)))

  (add-hook 'before-save-hook 'doom|org-update nil t)
  (add-hook 'evil-insert-state-exit-hook 'doom|org-update nil t))


(defun doom|org-init ()
  "Initializes org core."
  (def-popup! " *Agenda Commands*"  :align below :size 30)
  (def-popup! " *Org todo*"         :align below :size 5   :noselect t)
  (def-popup! "*Calendar*"          :align below :size 0.4)
  (def-popup! "*Org Links*"         :align below :size 5)
  (def-popup! "^\\*Org Agenda.+"    :align below :size 0.4 :regexp t)
  (def-popup! "^\\*Org Src .+\\*$"  :align below :size 0.4 :select t :regexp t)
  (def-popup! "^\\*Org-Babel.*\\*$" :align below :size 0.4 :regexp t)

  (setq-default
   org-export-coding-system 'utf-8

   ;; Appearance
   outline-blank-line t
   org-indent-mode-turns-on-hiding-stars t
   org-adapt-indentation nil
   org-blank-before-new-entry '((heading . nil) (plain-list-item . auto))
   org-cycle-separator-lines 1
   org-cycle-include-plain-lists t
   org-ellipsis 'hs-face
   org-entities-user '(("flat" "\\flat" nil "" "" "266D" "♭")
                       ("sharp" "\\sharp" nil "" "" "266F" "♯"))
   org-fontify-done-headline t
   org-fontify-quote-and-verse-blocks t
   org-fontify-whole-heading-line t
   org-footnote-auto-label 'plain
   org-hide-emphasis-markers t
   org-hide-leading-stars t
   org-image-actual-width nil
   org-indent-indentation-per-level 2
   org-pretty-entities t
   org-pretty-entities-include-sub-superscripts t
   org-startup-folded t
   org-startup-indented t
   org-startup-with-inline-images nil
   org-tags-column 0
   org-use-sub-superscripts '{}

   ;; Behavior
   org-catch-invisible-edits 'show
   org-checkbox-hierarchical-statistics nil
   org-completion-use-ido nil ; Use ivy/counsel for refiling
   org-confirm-elisp-link-function nil
   org-default-priority ?C
   org-hidden-keywords '(title)
   org-hierarchical-todo-statistics t
   org-log-done t
   org-loop-over-headlines-in-active-region t
   org-outline-path-complete-in-steps nil
   org-refile-use-outline-path t
   org-special-ctrl-a/e t

   ;; Sorting/refiling
   org-archive-location (concat org-directory "/archived/%s::")
   org-refile-targets '((nil . (:maxlevel . 2))) ; display full path in refile completion

   ;; Agenda
   org-agenda-restore-windows-after-quit nil
   org-agenda-skip-unavailable-files nil
   org-agenda-dim-blocked-tasks nil
   org-agenda-window-setup 'other-frame ; to get org-agenda to behave with shackle...
   org-agenda-inhibit-startup t
   org-agenda-files (append (f-entries org-directory (lambda (path) (f-ext? path "org")))
                            (f-entries (f-expand "projects" org-directory) (lambda (path) (f-ext? path "org")))
                            (f-entries (f-expand "contacts" org-directory) (lambda (path) (f-ext? path "org"))))
   org-todo-keywords '((sequence "[ ](t)" "[-](p)" "[?](m)" "|" "[X](d)")
                       (sequence "TODO(T)" "|" "DONE(D)")
                       (sequence "IDEA(i)" "NEXT(n)" "ACTIVE(a)" "WAITING(w)" "LATER(l)" "|" "CANCELLED(c)"))


   ;; Babel
   org-confirm-babel-evaluate nil   ; you don't need my permission
   org-src-fontify-natively t       ; make code pretty
   org-src-preserve-indentation t
   org-src-tab-acts-natively t
   org-src-window-setup 'current-window
   org-edit-src-content-indentation 0

   ;; Latex
   org-format-latex-options (plist-put org-format-latex-options :scale 1.5)
   org-format-latex-options (plist-put org-format-latex-options :background (face-attribute 'doom-default :background nil t))
   org-highlight-latex-and-related '(latex)
   org-latex-create-formula-image-program 'dvipng
   org-latex-image-default-width ".9\\linewidth"
   org-latex-preview-ltxpng-directory (concat doom-temp-dir "/ltxpng/")
   org-latex-remove-logfiles nil
   org-startup-with-latex-preview nil
   ;; org-latex-packages-alist
   ;; '(("" "gauss" t)
   ;;   ("" "physics" t) TODO Install this)
   )

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t) (ruby . t) (sh . t) (js . t) (css . t)
     (plantuml . t) (emacs-lisp . t) (matlab . t)
     (latex . t) (calc . t) (lisp . t) (lilypond . t)
     ;; (go . t)
     ;; (http . t)
     ;; (rust . t)
     ))

  (let ((ext-regexp (regexp-opt '("GIF" "JPG" "JPEG" "SVG" "TIF" "TIFF" "BMP" "XPM"
                                  "gif" "jpg" "jpeg" "svg" "tif" "tiff" "bmp" "xpm"))))
    (setq iimage-mode-image-regex-alist
          `((,(concat "\\(`?file://\\|\\[\\[\\|<\\|`\\)?\\([-+./_0-9a-zA-Z]+\\."
                      ext-regexp "\\)\\(\\]\\]\\|>\\|'\\)?") . 2)
            (,(concat "<\\(http://.+\\." ext-regexp "\\)>") . 1))))

  ;; Fontify checkboxes and dividers
  (defface org-list-bullet '((t ())) "Face for list bullets")
  (font-lock-add-keywords
   'org-mode '(("^ *\\([-+]\\|[0-9]+[).]\\) "
                (1 'org-list-bullet))
               ("^ *\\(-----+\\)$"
                (1 'org-meta-line))))

  ;; Enable encryption
  (require 'epa-file)
  (epa-file-enable)

  (require 'org-crypt)
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance '("crypt")
        org-crypt-key user-mail-address
        epa-file-encrypt-to user-mail-address)

  ;; smartparens config
  (sp-with-modes '(org-mode)
    (sp-local-pair "\\[" "\\]" :post-handlers '(("| " "SPC")))
    (sp-local-pair "\\(" "\\)" :post-handlers '(("| " "SPC")))
    (sp-local-pair "$$" "$$"   :post-handlers '((:add " | ")) :unless '(sp-point-at-bol-p))
    (sp-local-pair "{" nil))

  ;; bullets
  (use-package org-bullets :commands org-bullets-mode)

  ;; Keybinds
  (map! (:map org-mode-map
          "RET" nil
          "C-j" nil
          "C-k" nil
          :i [remap doom/inflate-space-maybe] 'org-self-insert-command
          :i "RET" 'org-return-indent)

        (:map evil-org-mode-map
          :n  "RET" 'doom/org-dwim-at-point
          ;;
          :ni "A-l" 'org-metaright
          :ni "A-h" 'org-metaleft
          :ni "A-k" 'org-metaup
          :ni "A-j" 'org-metadown
          :ni "A-L" 'org-shiftmetaright
          :ni "A-H" 'org-shiftmetaleft
          :ni "A-K" 'org-shiftmetaup
          :ni "A-J" 'org-shiftmetadown
          ;; Expand tables (or shiftmeta move)
          :ni "C-S-l" 'doom/org-table-append-field-or-shift-right
          :ni "C-S-h" 'doom/org-table-prepend-field-or-shift-left
          :ni "C-S-k" 'doom/org-table-prepend-row-or-shift-up
          :ni "C-S-j" 'doom/org-table-append-row-or-shift-down
          ;; Navigate table cells
          :i  "C-L" 'doom/org-table-next-field
          :i  "C-H" 'doom/org-table-previous-field
          :i  "C-K" 'doom/org-table-previous-row
          :i  "C-J" 'doom/org-table-next-row

          :i  "C-e" 'org-end-of-line
          :i  "C-a" 'org-beginning-of-line

          :i  "<tab>" 'doom/org-indent-or-next-field
          :i  [S-iso-lefttab] 'doom/org-dedent-or-prev-field ; for GNU Emacs
          :i  [(shift tab)] 'doom/org-dedent-or-prev-field
          :i  [backtab] 'doom/org-dedent-or-prev-field

          :n  "<tab>" 'doom/org-toggle-fold

          :nv "j"   'evil-next-visual-line
          :nv "k"   'evil-previous-visual-line
          :v  "<S-tab>" 'doom/yas-insert-snippet

          :i  "M-a" (λ! (evil-visual-state) (org-mark-element))
          :n  "M-a" 'org-mark-element
          :v  "M-a" 'mark-whole-buffer

          :ni "<M-return>"   (λ! (doom/org-insert-item 'below))
          :ni "<S-M-return>" (λ! (doom/org-insert-item 'above))

          ;; Formatting shortcuts
          :i  "M-b" (λ! (doom/org-surround "*")) ; bold
          :i  "M-u" (λ! (doom/org-surround "_")) ; underline
          :i  "M-i" (λ! (doom/org-surround "/")) ; italics
          :i  "M-`" (λ! (doom/org-surround "+")) ; strikethrough

          :v  "M-b" "S*"
          :v  "M-u" "S_"
          :v  "M-i" "S/"
          :v  "M-`" "S+"

          (:localleader
            :n  "RET" 'org-archive-subtree
            :n  "SPC" 'doom/org-toggle-checkbox
            :n  "/"  'org-sparse-tree
            :n  "="  'org-align-all-tags
            :n  "?"  'org-tags-view
            :n  "D"  'org-deadline
            :n  "L"  'org-store-link
            :n  "R"  (λ! (org-metaleft) (org-archive-to-archive-sibling)) ; archive to parent sibling
            :n  "T"  'org-todo
            :n  "a"  'org-agenda
            :n  "d"  'org-time-stamp
            :n  "e"  'org-edit-special
            :n  "i"  'doom/org-toggle-inline-images-at-point
            :nv "l"  'org-insert-link
            :n  "n"  (λ! (if (buffer-narrowed-p) (widen) (org-narrow-to-subtree)))
            :n  "r"  'org-refile
            :n  "s"  'org-schedule
            :n  "t"  (λ! (org-todo (if (org-entry-is-todo-p) 'none 'todo)))
            :v  "t"  (λ! (evil-ex-normal evil-visual-beginning evil-visual-end "\\t"))
            :n  "v"  'variable-pitch-mode
            ;; :n  "w"  'writing-mode
            :n  "x"  'doom/org-remove-link)

          ;; TODO Improve folding bindings
          :n  "za"  'doom/org-toggle-fold
          :n  "zA"  'org-shifttab
          :n  "zc"  'outline-hide-subtree
          :n  "zC"  (λ! (outline-hide-sublevels 1))
          :n  "zd"  (lambda (&optional arg) (interactive "p") (outline-hide-sublevels (or arg 3)))
          :n  "zm"  (λ! (outline-hide-sublevels 1))
          :n  "zo"  'outline-show-subtree
          :n  "zO"  'outline-show-all
          :n  "zr"  'outline-show-all

          :m  "]]"  (λ! (call-interactively 'org-forward-heading-same-level) (org-beginning-of-line))
          :m  "[["  (λ! (call-interactively 'org-backward-heading-same-level) (org-beginning-of-line))
          :m  "]l"  'org-next-link
          :m  "[l"  'org-previous-link

          :m  "gh"  'outline-up-heading
          :m  "gj"  'org-forward-heading-same-level
          :m  "gk"  'org-backward-heading-same-level
          :m  "gl"  (λ! (call-interactively 'outline-next-visible-heading) (show-children))

          :n  "go"  'org-open-at-point
          :n  "gO"  (λ! (let ((org-link-frame-setup (append '((file . find-file-other-window)) org-link-frame-setup))
                              (org-file-apps '(("\\.org$" . emacs)
                                               (t . "open \"%s\""))))
                          (call-interactively 'org-open-at-point)))

          :n  "gQ"  'org-fill-paragraph
          :m  "$"   'org-end-of-line
          :m  "^"   'org-beginning-of-line
          :n  "<"   'org-metaleft
          :n  ">"   'org-metaright
          :v  "<"   (λ! (org-metaleft)  (evil-visual-restore))
          :v  ">"   (λ! (org-metaright) (evil-visual-restore))
          :n  "-"   'org-cycle-list-bullet
          :m  "<tab>" 'org-cycle)

        (:map org-src-mode-map
          :n  "<escape>" (λ! (message "Exited") (org-edit-src-exit)))

        (:after org-agenda
          (:map org-agenda-mode-map
            :e "<escape>" 'org-agenda-Quit
            :e "m"   'org-agenda-month-view
            :e "C-j" 'org-agenda-next-item
            :e "C-k" 'org-agenda-previous-item
            :e "C-n" 'org-agenda-next-item
            :e "C-p" 'org-agenda-previous-item))))


;; FIXME
;; Initializes my own org-mode attachment system. I didn't like Org's native
;; one. Mine stores attachments in a global org .attach directory. It also
;; implements drag-and-drop file support and attachment icons. It also treats
;; images specially.
;;
;; To clean up unreferenced attachments, call `doom/org-cleanup-attachments'
(defun doom|org-init-attach ()
  (setq org-attach-directory doom-org-attachment-dir)

  ;; Don't track attachments in recentf or projectile
  (push (format "/%s.+$" (regexp-quote doom-org-attachment-dir)) recentf-exclude)
  (push ".attach" projectile-globally-ignored-file-suffixes)

  ;; FIXME Use all-the-icons
  ;; (doom-fix-unicode '("FontAwesome" 13) ? ? ? ? ? ? ? ?)
  ;; Drag-and-drop support
  (require 'org-download)
  (setq-default org-download-image-dir doom-org-attachment-dir
                org-download-heading-lvl nil
                org-download-timestamp "_%Y%m%d_%H%M%S")

  (setq org-download-screenshot-method
        (cond (IS-MAC   "screencapture -i %s")
              (IS-LINUX "maim --opengl -s %s")))

  ;; Write download paths relative to current file
  (defun org-download--dir-2 () nil)
  (defun doom*org-download--fullname (path)
    (f-relative path (f-dirname (buffer-file-name))))
  (advice-add 'org-download--fullname :filter-return 'doom*org-download--fullname)

  ;; Add another drag-and-drop handler that will handle anything but image files
  (setq dnd-protocol-alist `(("^\\(https?\\|ftp\\|file\\|nfs\\):\\(//\\)?" . doom/org-download-dnd)
                             ,@dnd-protocol-alist))

  ;; keybinds
  (map! (:leader
          :n "oa" (@find-file-in doom-org-attachment-dir))))


;; My own, centralized exporting system as well.
(defun doom|org-init-export ()
  (setq org-export-directory (f-expand ".export" org-directory)
        org-export-backends '(ascii html latex md)
        org-export-with-toc t
        org-export-with-author t)

  ;; Export to a central directory (why isn't this easier?)
  (unless (file-directory-p org-export-directory)
    (mkdir org-export-directory))
  (defun doom*org-export-output-file-name (args)
    (unless (nth 2 args)
      (setq args (append args (list org-export-directory))))
    args)
  (advice-add 'org-export-output-file-name :filter-args 'doom*org-export-output-file-name)

  ;; (require 'ox-pandoc)
  ;; (setq org-pandoc-options '((standalone . t) (mathjax . t) (parse-raw . t)))

  ;; keybinds
  (map! (:leader
          :n "oe" (@find-file-in org-export-directory))))


;; Sets up a sane `org-capture' workflow, wherein the org-capture buffer is
;; opened in a popup frame, and can be invoked from outside Emacs as well.
;;
;; See `doom/org-capture'
(defun doom|org-init-capture ()
  "Set up a sane `org-capture' workflow."
  (setq org-default-notes-file (f-expand "notes.org" doom-org-dir))

  (require 'org-capture)
  (require 'org-protocol)
  (def-popup! "*Org Select*" :align below :size 0.4)

  (defadvice org-capture (after make-full-window-frame activate)
    "If org-capture creates a new frame, this initializes it properly, by
deleting other windows and blanking out the mode-line."
    (when (equal "org-capture" (frame-parameter nil 'name))
      (setq mode-line-format nil)
      (delete-other-windows)))

  (defadvice org-capture-finalize (after delete-capture-frame activate)
    "Closes the frame once org-capture is done."
    (when (equal "org-capture" (frame-parameter nil 'name))
      (delete-frame)))

  (setq org-capture-templates
        '(;; TODO: New Task (todo)
          ;; TODO: New vocabulary word

          ("c" "Changelog" entry
           (file+headline (f-expand "CHANGELOG.org" (doom/project-root)) "Unreleased")
           "* %?")

          ;; ("p" "Project Notes" entry
          ;;  (file+headline org-default-notes-file "Inbox")
          ;;  "* %u %?\n%i" :prepend t)

          ;; ("m" "Major-mode Notes" entry
          ;;  (file+headline org-default-notes-file "Inbox")
          ;;  "* %u %?\n%i" :prepend t)

          ("n" "Notes" entry
           (file+headline org-default-notes-file "Inbox")
           "* %u %?\n%i" :prepend t)

          ;; ("v" "Vocab" entry
          ;;  (file+headline (concat org-directory "topics/vocab.org") "Unsorted")
          ;;  "** %i%?\n")
          )))

;; Getting org to behave
(defun doom|org-hacks ()
  ;; Don't open separate windows
  (push '(file . find-file) org-link-frame-setup)

  ;; Let OS decide what to do with files when opened
  (setq org-file-apps
        `(("\\.org$" . emacs)
          (t . ,(cond (IS-MAC "open -R \"%s\"")
                      (IS-LINUX "xdg-open \"%s\"")))))

  ;; Don't clobber recentf with agenda files
  (defun org-is-agenda-file (filename)
    (find (file-truename filename) org-agenda-files :key 'file-truename
          :test 'equal))
  (pushnew 'org-is-agenda-file recentf-exclude)

  ;; Remove highlights on ESC
  (defun doom*org-remove-occur-highlights (&rest args)
    (when (eq major-mode 'org-mode) (org-remove-occur-highlights)))
  (advice-add 'evil-force-normal-state :before 'doom*org-remove-occur-highlights)

  ;; Don't reset org-hide!
  (advice-add 'org-find-invisible-foreground :override 'ignore))

(provide 'module-org)
;;; module-org.el ends here
