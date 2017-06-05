
	(defmacro @find-file-in (path &optional project-p)
	  "Returns a interactive function for searching files"
	  `(lambda () (interactive)
	     (let ((default-directory ,path))
	       (,@(if project-p
	              '(counsel-projectile-find-file)
	            '(call-interactively 'counsel-find-file)
	            )))))

	(load (concat user-emacs-directory "core/core"))

	(doom core-ui            ; draw me like one of your French editors
	      core-popup         ; taming sudden and inevitable windows
	      core-os            ; os-specific configs
	      core-modeline      ; a self-contained mode-line config for masochists
	      core-evil          ; vim in emacs; come to the dark side, we have cookies
	      core-editor        ; fill the editor-shaped hole in the emacs OS
	      ;; core-docs          ; highway to code documentation
	      core-company       ; auto-completion, for the lazy typist
	      core-yasnippet     ; snippets, for the lazier typist
	      core-autoinsert    ; file templates, for the laziest typist
	      ;; core-flycheck      ; get tazed for every semicolon you forget
	      core-project       ; for project navigation aficionados
	      core-vcs           ; remember remember, that commit in November
	      core-ivy           ; a search engine for life and love
	      core-workgroups    ; cure Emacs alzheimers + tab emulation
	      core-eval          ; run code, run + REPL support
	      core-scratch       ; a perdier scratch buffer

	  ;; Dev environments
	      ;; module-asm         ; assembly for fun
	      ;; module-cc          ; C/C++/Obj-C madness
	      ;; module-crystal     ; ruby at the speed of c
	      ;; module-csharp      ; unity, .NET, and mono shenanigans
	      ;; module-css         ; #big-bang::before { content: ""; }
	      module-data        ; config/data formats
	      module-elisp       ; drown in parentheses
	      ;; module-eshell      ; so I can have a sane shell, even in Windows
	      ;; module-go          ; the hipster dialect
	      ;; module-haskell     ; a language that's lazier than I am
	      ;; module-java        ; the poster child for carpal tunnel syndrome
	      ;; module-js          ; all(hope(abandon(ye(who(enter(here))))))
	      ;; module-julia       ; a better, faster MATLAB
	      ;; module-latex       ; write papers in Emacs
	      module-lua         ; one-based indices? one-based indices
	      ;;module-neotree_mods  ; minor customizations
	      ;; module-octave      ; math isn't a choice, it's a way of life
	      ;; module-php         ; make php less awful to work with
	      ;; module-processing  ; for prototyping
	      module-python      ; beautiful is better than ugly
	      module-rest        ; emacs as a service
	      ;; module-ruby        ; 1.step do {|i| p "Ruby is #{i&1==0?'love':'life'}"}
	      ;; module-rust        ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
	      ;; module-scala       ; java, but good
	      module-sh          ; she sells Z-shells by the C XOR
	      ;; module-swift       ; who asked for emoji variables?
	      module-text        ; writing docs for people to ignore
	      module-web         ; The end is always near </html>

	  ;; Org
	      module-org         ; for organized fearless leader
	      module-org_man     ; links for viewing hyperlinked Man pages

	  ;; Custom/experimental modules
	      ;; custom-db          ; emacs as a db browser/client
	      ;; custom-debug       ; nigh-universal debugging
	      ;; custom-demo        ; allow me to demonstrate...
	      ;; custom-screeps     ; The programmer MMO
	      custom-tags        ; if you liked it you should've generated a tag for it
	      custom-tmux        ; close the rift between GUI & terminal
	      ;; custom-write       ; Emacs as a word processor

	  ;; Personal settings
	      ;; my-commands
	      my-bindings
	)

(setq custom-file "~/.emacs.d/custom-settings.el")
(load custom-file t)

;; Prompt about unsaved customizations at termination
; (add-hook 'kill-emacs-query-functions
;          'custom-prompt-customize-unsaved-options)

; (custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  '(ansi-color-names-vector
;    ["#0d0f11" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#c7abc7" "#8abeb7" "#ffffff"])
;  '(auto-compile-on-save-mode t)
;  '(auto-compile-update-autoloads t)
;  '(auto-compile-verbose t)
;  '(beacon-blink-when-point-moves-vertically 10)
;  '(blink-matching-paren nil)
;  '(browse-url-browser-function (quote eww-browse-url))
;  '(browse-url-chrome-program "google-chrome")
;  '(compilation-scroll-output t)
;  '(cua-enable-cua-keys (quote shift))
;  '(cursor-type (quote bar))
;  '(custom-enabled-themes (quote (doom-one)))
;  '(custom-safe-themes
;    (quote
;     ("d37b6fc3ea627226e0a703f3b97f18e42d5a58c293a7d34c2483688f72e66ccf" "9f3181dc1fabe5d58bbbda8c48ef7ece59b01bed606cfb868dd147e8b36af97c" "227e2c160b0df776257e1411de60a9a181f890cfdf9c1f45535fc83c9b34406b" "e91ca866d6cbb79786e314e0466f4f1b8892b72e77ed702e53bf7565e0dfd469" "18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "6bde11b304427c7821b72a06a60e8d079b8f7ae10b407d8af37ed5e5d59b1324" "e146feef4c2f5abc6140e40f69d75b05cb27ae56644b6f9ced362416090bed1d" default)))
;  '(diary-file "~/org/seth.diary")
;  '(diary-file-name-prefix t)
;  '(diary-hook (quote (ignore)))
;  '(display-time-mode t)
;  '(doom-neotree-enable-variable-pitch nil t)
;  '(doom-neotree-line-spacing 1 t)
;  '(enable-recursive-minibuffers t)
;  '(eval-expression-print-length nil)
;  '(eval-expression-print-level nil)
;  '(evil-tabs-mode t)
;  ;;'(evil-want-C-u-scroll t)
;  '(explicit-shell-file-name "/usr/local/bin/zsh")
;  '(fci-rule-color "#969896")
;  '(find-function-source-path nil)
;  '(font-use-system-font t)
;  '(global-evil-tabs-mode t)
;  '(global-orglink-mode t)
;  '(global-semantic-highlight-func-mode t)
;  '(gmm-tool-bar-style (quote retro))
;  '(gnus-group-update-tool-bar nil)
;  '(gnus-summary-tool-bar nil)
;  '(helm-M-x-always-save-history t)
;  '(helm-adaptive-mode t nil (helm-adaptive))
;  '(helm-allow-mouse nil)
;  '(helm-autoresize-mode t)
;  '(hscroll-margin 1)
;  '(hscroll-step 1)
;  '(immortal-scratch-mode t)
;  '(indent-tabs-mode nil)
;  '(inhibit-startup-echo-area-message "ub2")
;  '(inhibit-startup-screen t)
;  '(initial-scratch-message nil)
;  '(jdee-db-active-breakpoint-face-colors (cons "#0d0f11" "#41728e"))
;  '(jdee-db-requested-breakpoint-face-colors (cons "#0d0f11" "#b5bd68"))
;  '(jdee-db-spec-breakpoint-face-colors (cons "#0d0f11" "#585858"))
;  '(make-backup-files nil)
;  '(markdown-enable-wiki-links t)
;  '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
;  '(neo-auto-indent-point t t)
;  '(neo-click-changes-root nil)
;  '(neo-create-file-auto-open t t)
;  '(neo-hidden-regexp-list (quote ("\\.pyc$" "~$" "^#.*#$" "\\.elc$")))
;  '(neo-keymap-style (quote default))
;  '(neo-mode-line-type (quote neotree) t)
;  '(neo-show-hidden-files t)
;  '(neo-show-updir-line t t)
;  '(neo-smart-open t t)
;  '(neo-theme (quote nerd) t)
;  '(neo-toggle-window-keep-p nil)
;  '(neo-window-position (quote left))
;  '(neo-window-width 25 t)
;  '(neotree-show nil)
;  '(normal-erase-is-backspace-mode 1)
;  '(org-adapt-indentation nil)
;  '(org-agenda-dim-blocked-tasks nil)
;  '(org-agenda-files
;    (quote
;     ("~/org/seth.org" "~/org/seth.t.chase@gmail.com.org")))
;  '(org-agenda-finalize-hook (quote (org-agenda-property-add-properties)))
;  '(org-agenda-include-diary t)
;  '(org-agenda-inhibit-startup t)
;  '(org-agenda-mouse-1-follows-link t)
;  '(org-agenda-start-with-clockreport-mode t)
;  '(org-agenda-start-with-follow-mode t)
;  '(org-agenda-start-with-log-mode (quote clockcheck))
;  '(org-agenda-window-setup (quote other-frame))
;  '(org-babel-hash-show-time t)
;  '(org-babel-load-languages (quote ((python . t) (sql . t) (shell . t))))
;  '(org-babel-no-eval-on-ctrl-c-ctrl-c nil)
;  '(org-babel-shell-names
;    (quote
;     ("sh" "bash" "csh" "ash" "dash" "ksh" "mksh" "posh" "zsh")))
;  '(org-capture-templates
;    (quote
;     (("c" "Changelog" entry
;       (file+headline
;        (f-expand "CHANGELOG.org"
;                  (doom/project-root))
;        "Unreleased")
;       "* %?")
;      ("n" "Notes" entry
;       (file+headline org-default-notes-file "Inbox")
;       "* %u %? %i" :prepend t))))
;  '(org-capture-use-agenda-date t)
;  '(org-confirm-babel-evaluate nil)
;  '(org-confirm-elisp-link-function nil)
;  '(org-download-heading-lvl nil)
;  '(org-download-image-dir ".attach/")
;  '(org-download-screenshot-method "maim --opengl -s %s")
;  '(org-download-timestamp "_%Y%m%d_%H%M%S")
;  '(org-edit-src-content-indentation 0)
;  '(org-ellipsis "  ")
;  '(org-export-allow-bind-keywords t)
;  '(org-export-babel-evaluate (quote inline-only))
;  '(org-export-backends (quote (ascii html icalendar latex md org)))
;  '(org-export-coding-system (quote utf-8) t)
;  '(org-export-dispatch-use-expert-ui t)
;  '(org-export-in-background nil)
;  '(org-export-with-archived-trees t)
;  '(org-export-with-clocks t)
;  '(org-export-with-email t)
;  '(org-export-with-planning t)
;  '(org-export-with-priority t)
;  '(org-export-with-properties t)
;  '(org-fontify-done-headline t)
;  '(org-fontify-quote-and-verse-blocks t)
;  '(org-fontify-whole-heading-line t)
;  '(org-hide-block-startup t)
;  '(org-journal-dir "~/org/journal/")
;  '(org-org-htmlized-css-url "")
;  '(org-projectile:allow-tramp-projects t)
;  '(org-projectile:projects-file "/home/ub2/org/Projects/TODO.org")
;  '(org-recent-headings-candidate-number-limit 5)
;  '(org-recent-headings-mode t)
;  '(org-src-tab-acts-natively t)
;  '(org-startup-indented t)
;  '(org-startup-with-inline-images t)
;  '(org-support-shift-select t)
;  '(package-enable-at-startup t)
;  '(package-hidden-regexps (quote ("^[^~]+.*$" "^~.*")))
;  '(package-selected-packages
;    (quote
;     (fold-this hideshowvis yafolding markdown-edit-indirect markdown-mode+ markdown-preview-eww obfusurl immortal-scratch omni-kill omni-log omni-scratch omni-tags persistent-scratch persp-fr persp-mode persp-mode-projectile-bridge persp-projectile scratch scratch-ext scratch-log scratch-pop scratches unkillable-scratch flex-isearch ido-at-point ido-completing-read+ ido-flex-with-migemo ido-grid-mode ido-select-window ido-sort-mtime ido-ubiquitous ido-yes-or-no idomenu cmds-menu menu-bar+ minibuffer-line minimap pianobar ppd-sr-speedbar project-explorer project-local-variables project-persist-drawer project-root project-shells projectile-codesearch projectile-direnv projectile-git-autofetch projectile-speedbar projectile-variable sr-speedbar tabbar tabbar-ruler tool-bar+ totd yascroll cython-mode move-dup move-text autofit-frame emacs-setup fix-input frame-cmds frame-fns frame-mode frame-tag framemove frames-only-mode free-keys org-protocol-jekyll hledger-mode hide-comnt hide-lines hide-region hideshow-org helm helm-anything helm-bind-key helm-books helm-chrome helm-commandlinefu helm-describe-modes helm-fuzzier helm-git helm-git-grep helm-gitlab helm-orgcard helm-proc helm-project-persist helm-spotify helm-spotify-plus helm-systemd helm-themes helm-xref ace-mc centered-cursor-mode evil-mc mc-extras dired-narrow websocket win-switch window+ window-jump window-layout window-purpose tablist auto-org-md autobookmarks calfw calfw-gcal counsel-osx-app imenu-anywhere ivy-gitlab ivy-todo orgtbl-aggregate orgtbl-join orgtbl-show-header origami osx-browse osx-clipboard osx-lib osx-org-clock-menubar codebug operate-on-number org-dotemacs org-easy-img-insert org-ehtml org-repo-todo org-sticky-header outline-magic zeal-at-point yard-mode yaml-mode xpm workgroups2 wgrep web-mode visual-fill-column vimrc-mode use-package unityjs-mode toml-mode tide swift-mode stylus-mode stripe-buffer smex smartparens smart-forward slime shader-mode shackle sass-mode ruby-refactor rspec-mode rotate-text repl-toggle realgud rainbow-mode rainbow-delimiters racer quickrun pug-mode processing-mode powerline pip-requirements phpunit php-refactor-mode php-extras php-boris persistent-soft pcre2el ox-pandoc orglink org2jekyll org-wc org-tree-slide org-transform-tree-table org-tracktable org-time-budgets org-table-sticky-header org-table-comment org-seek org-review org-recent-headings org-random-todo org-preview-html org-plus-contrib org-parser org-mac-link org-journal org-jekyll org-gcal org-fstree org-download org-doing org-dashboard org-context org-cliplink org-capture-pop-frame org-bullets org-bookmark-heading org-board org-beautify-theme org-babel-eval-in-repl org-attach-screenshot org-alert org-agenda-property org-ac openwith opencl-mode omnisharp occur-context-resize ob-sql-mode ob-ipython ob-browser ob-async nose nodejs-repl nlinum neotree nasm-mode moonscript modern-cpp-font-lock mips-mode meghanada markdown-toc less-css-mode julia-mode jsx-mode json-mode js2-refactor irony-eldoc impatient-mode imenu-list ido-vertical-mode highlight-quoted highlight-numbers highlight-indentation help-fns+ haxor-mode haskell-mode hack-mode groovy-mode goto-last-change gorepl-mode google-this go-eldoc glsl-mode gitignore-mode gitconfig-mode git-messenger git-gutter-fringe flycheck-rust flycheck-pos-tip flycheck-irony flx-ido fancy-narrow exec-path-from-shell esup ert-runner ensime emr emmet-mode elmacro eldoc-eval editorconfig dumb-jump doom-theme dockerfile-mode disaster dired-k demangle-mode dash-at-point cuda-mode crystal-mode company-web company-tern company-statistics company-sourcekit company-shell company-restclient company-racer company-quickhelp company-lua company-irony-c-headers company-irony company-inf-ruby company-go company-dict company-ansible company-anaconda command-log-mode coffee-mode cmake-mode browse-at-remote auto-yasnippet auto-compile applescript-mode android-mode all-the-icons ace-link)))
;  '(persistent-scratch-autosave-mode t)
;  '(projectile-cache-file "/home/ub2/.emacs.d/private/cache/SERVER2/projectile.cache")
;  '(projectile-completion-system (quote helm))
;  '(projectile-enable-caching t)
;  '(projectile-file-exists-remote-cache-expire nil)
;  '(projectile-globally-ignored-files (quote ("Icon" "TAGS" "*.pyc")))
;  '(projectile-require-project-root nil)
;  '(projectile-sort-order (quote modification-time))
;  '(projectile-switch-project-action (quote doom/wg-projectile-switch-project))
;  '(python-shell-completion-native-enable t)
;  '(python-shell-interpreter-args "" t)
;  '(python-shell-prompt-block-regexp "\\.\\.\\.\\.: " t)
;  '(python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: " t)
;  '(python-shell-prompt-regexp "In \\[[0-9]+\\]: " t)
;  '(python-shell-virtualenv-root "~/.virtualenvs/dev")
;  '(recenter-positions (quote (middle top bottom)))
;  '(recenter-redisplay t)
;  '(scroll-bar-mode (quote right))
;  '(scroll-conservatively 1001)
;  '(scroll-preserve-screen-position t)
;  '(semantic-mode t)
;  '(semantic-stickyfunc-indent-string "")
;  '(showkey-tooltip-mode nil)
;  '(speedbar-default-position (quote right))
;  '(speedbar-directory-unshown-regexp "^\\(\\..*\\)\\'")
;  '(speedbar-frame-parameters
;    (quote
;     ((minibuffer . t)
;      (width . 45)
;      (border-width . 0)
;      (menu-bar-lines . 1)
;      (tool-bar-lines . 3)
;      (unsplittable . f)
;      (left-fringe . 0))))
;  '(speedbar-frame-plist
;    (quote
;     (minibuffer t width 50 border-width 0 internal-border-width 0 unsplittable f default-toolbar-visible-p f has-modeline-p t menubar-visible-p f default-gutter-visible-p t)))
;  '(speedbar-show-unknown-files t)
;  '(speedbar-supported-extension-expressions
;    (quote
;     (".org" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".*")))
;  '(speedbar-track-mouse-flag t)
;  '(sr-speedbar-default-width 80)
;  '(sr-speedbar-delete-windows t)
;  '(sr-speedbar-max-width 0)
;  '(tab-width 4)
;  '(tool-bar-pop-up-mode nil)
;  '(tool-bar-position (quote top))
;  '(tool-bar-style (quote text))
;  '(unkillable-scratch t)
;  '(use-package-enable-imenu-support t)
;  '(use-package-verbose t)
;  '(vc-annotate-background "#000000")
;  '(vc-annotate-color-map
;    (quote
;     ((20 . "#B6E63E")
;      (40 . "#c4db4e")
;      (60 . "#d3d15f")
;      (80 . "#E2C770")
;      (100 . "#ebb755")
;      (120 . "#f3a73a")
;      (140 . "#FD971F")
;      (160 . "#fb713a")
;      (180 . "#fa4b56")
;      (200 . "#F92672")
;      (220 . "#f33260")
;      (240 . "#ed3f4e")
;      (260 . "#E74C3C")
;      (280 . "#dd6a60")
;      (300 . "#d38885")
;      (320 . "#c9a6aa")
;      (340 . "#C0C5CF")
;      (360 . "#C0C5CF"))))
;  '(vc-annotate-very-old-color nil)
;  '(vc-follow-symlinks nil)
;  '(vc-make-backup-files nil)
;  '(visible-bell t))
; (custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  )
