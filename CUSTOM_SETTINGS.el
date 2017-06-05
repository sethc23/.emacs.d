	(setq ansi-color-names-vector
          ["#0d0f11" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#c7abc7" "#8abeb7" "#ffffff"])
	(setq auto-compile-on-save-mode t)
	(setq auto-compile-update-autoloads t)
	(setq auto-compile-verbose t)
	(setq beacon-blink-when-point-moves-vertically 10)
	(setq blink-matching-paren nil)
	(setq browse-url-browser-function (quote eww-browse-url))
	(setq browse-url-chrome-program "google-chrome")
	(setq compilation-scroll-output t)
	(setq cua-enable-cua-keys (quote shift))
	(setq cursor-type (quote bar))
	(setq display-time-mode t)
	(setq enable-recursive-minibuffers t)
	(setq eval-expression-print-length nil)
	(setq eval-expression-print-level nil)
	; (setq evil-want-C-u-scroll t)
	(setq fci-rule-color "#969896")
	(setq font-use-system-font t)
	(setq inhibit-startup-echo-area-message "ub2")
	(setq make-backup-files nil)
	(setq markdown-enable-wiki-links t)
	(setq mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
	(setq normal-erase-is-backspace-mode 1)
	(setq showkey-tooltip-mode t)
	(setq tab-width 4)
	(setq visible-bell t)

	(setq hscroll-margin 1)
	(setq hscroll-step 1)
	(setq recenter-positions (quote (middle top bottom)))
	(setq recenter-redisplay t)
	(setq scroll-bar-mode (quote right))
	(setq scroll-conservatively 1001)
	(setq scroll-preserve-screen-position t)

	(setq evil-tabs-mode t)
	(setq global-evil-tabs-mode t)

	(setq custom-enabled-themes (quote (doom-one)))
	(setq custom-safe-themes
		(quote
			("d37b6fc3ea627226e0a703f3b97f18e42d5a58c293a7d34c2483688f72e66ccf" "9f3181dc1fabe5d58bbbda8c48ef7ece59b01bed606cfb868dd147e8b36af97c" "227e2c160b0df776257e1411de60a9a181f890cfdf9c1f45535fc83c9b34406b" "e91ca866d6cbb79786e314e0466f4f1b8892b72e77ed702e53bf7565e0dfd469" "18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "6bde11b304427c7821b72a06a60e8d079b8f7ae10b407d8af37ed5e5d59b1324" "e146feef4c2f5abc6140e40f69d75b05cb27ae56644b6f9ced362416090bed1d" default)))

	(setq gmm-tool-bar-style (quote retro))
	(setq gnus-group-update-tool-bar nil)
	(setq gnus-summary-tool-bar nil)
	(setq tool-bar-pop-up-mode nil)
	(setq tool-bar-position (quote top))
	(setq tool-bar-style (quote text))

	(setq doom-neotree-enable-variable-pitch t)
	(setq doom-neotree-line-spacing 1)
	(setq neo-auto-indent-point t)
	(setq neo-click-changes-root nil)
	(setq neo-create-file-auto-open t)
	(setq neo-hidden-regexp-list (quote ("\\.pyc$" "~$" "^#.*#$" "\\.elc$")))
	(setq neo-keymap-style (quote default))
	(setq neo-mode-line-type (quote neotree))
	(setq neo-show-hidden-files t)
	(setq neo-show-updir-line t)
	(setq neo-smart-open t)
	(setq neo-theme (quote nerd))
	(setq neo-toggle-window-keep-p nil)
	(setq neo-window-position (quote left))
	(setq neo-window-width 25)
	(setq neotree-show nil)

	(setq immortal-scratch-mode t)
	(setq inhibit-startup-screen t)
	(setq initial-scratch-message nil)
	(setq persistent-scratch-autosave-mode t)
	(setq unkillable-scratch t)

	(setq speedbar-default-position (quote right))
	(setq speedbar-directory-unshown-regexp "^\\(\\..*\\)\\'")
	(setq speedbar-frame-parameters
		(quote
			((minibuffer . t)
			 (width . 45)
			 (border-width . 0)
			 (menu-bar-lines . 1)
			 (tool-bar-lines . 3)
			 (unsplittable . f)
			 (left-fringe . 0))))
	(setq speedbar-frame-plist
      (quote
          (minibuffer t width 50 border-width 0 internal-border-width 0 unsplittable f default-toolbar-visible-p f has-modeline-p t menubar-visible-p f default-gutter-visible-p t)))
	(setq speedbar-show-unknown-files t)
	(setq speedbar-supported-extension-expressions
		(quote
			(".org" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".*")))
	(setq speedbar-track-mouse-flag t)
	(setq sr-speedbar-default-width 80)
	(setq sr-speedbar-delete-windows t)
	(setq sr-speedbar-max-width 0)

	(setq diary-file "~/org/seth.diary")
	(setq diary-file-name-prefix t)
	(setq diary-hook (quote (ignore)))

	(setq global-orglink-mode t)
	(setq indent-tabs-mode nil)
	(setq org-adapt-indentation nil)
	(setq org-confirm-elisp-link-function nil)
	(setq org-download-heading-lvl nil)
	(setq org-download-image-dir ".attach/")
	(setq org-download-screenshot-method "maim --opengl -s %s")
	(setq org-download-timestamp "_%Y%m%d_%H%M%S")
	(setq org-edit-src-content-indentation 0)
	(setq org-ellipsis "  ")
	(setq org-hide-block-startup t)
	(setq org-mode t)
	(setq org-startup-indented t)
	(setq org-startup-with-inline-images t)
	(setq org-journal-dir "~/org/journal/")
	(setq org-org-htmlized-css-url "")
	(setq org-recent-headings-candidate-number-limit 5)
	(setq org-recent-headings-mode t)
	(setq org-src-tab-acts-natively t)
	(setq org-support-shift-select t)

	(setq org-agenda-dim-blocked-tasks nil)
	(setq org-agenda-files
		(quote (
			"~/org/seth.org"
			"~/org/seth.t.chase@gmail.com.org"
		)))
	(setq org-agenda-finalize-hook (quote (org-agenda-property-add-properties)))
	(setq org-agenda-include-diary t)
	(setq org-agenda-inhibit-startup t)
	(setq org-agenda-mouse-1-follows-link t)
	(setq org-agenda-start-with-clockreport-mode t)
	(setq org-agenda-start-with-follow-mode t)
	(setq org-agenda-start-with-log-mode (quote clockcheck))
	(setq org-agenda-window-setup (quote other-frame))

	(setq org-babel-hash-show-time t)
	(setq org-babel-load-languages
        (quote (
            (python . t)
            (sql . t)
            (shell . t)
        )))
	(setq org-babel-no-eval-on-ctrl-c-ctrl-c nil)
	(setq org-babel-shell-names
		(quote
			("sh" "bash" "csh" "ash" "dash" "ksh" "mksh" "posh" "zsh")))
	(setq org-confirm-babel-evaluate nil)

	(setq org-capture-templates
		(quote (
			("c" "Changelog" entry
				(file+headline (f-expand "CHANGELOG.org" (doom/project-root)) "Unreleased")
				"* %?")
			("n" "Notes" entry
				(file+headline org-default-notes-file "Inbox")
				"* %u %? %i"
				:prepend t)
		)))
	(setq org-capture-use-agenda-date t)

	(setq org-export-allow-bind-keywords t)
	(setq org-export-babel-evaluate (quote inline-only))
	(setq org-export-backends (quote (ascii html icalendar latex md org)))
	(setq org-export-coding-system (quote utf-8))
	(setq org-export-dispatch-use-expert-ui t)
	(setq org-export-in-background nil)
	(setq org-export-with-archived-trees t)
	(setq org-export-with-clocks t)
	(setq org-export-with-email t)
	(setq org-export-with-planning t)
	(setq org-export-with-priority t)
	(setq org-export-with-properties t)

	(setq org-fontify-done-headline t)
	(setq org-fontify-quote-and-verse-blocks t)
	(setq org-fontify-whole-heading-line t)

	(setq package-enable-at-startup t)
	(setq package-hidden-regexps (quote ("^[^~]+.*$" "^~.*")))
	(setq package-selected-packages
		(quote
			(fold-this hideshowvis yafolding markdown-edit-indirect markdown-mode+ markdown-preview-eww obfusurl immortal-scratch omni-kill omni-log omni-scratch omni-tags persistent-scratch persp-fr persp-mode persp-mode-projectile-bridge persp-projectile scratch scratch-ext scratch-log scratch-pop scratches unkillable-scratch flex-isearch ido-at-point ido-completing-read+ ido-flex-with-migemo ido-grid-mode ido-select-window ido-sort-mtime ido-ubiquitous ido-yes-or-no idomenu cmds-menu menu-bar+ minibuffer-line minimap pianobar ppd-sr-speedbar project-explorer project-local-variables project-persist-drawer project-root project-shells projectile-codesearch projectile-direnv projectile-git-autofetch projectile-speedbar projectile-variable sr-speedbar tabbar tabbar-ruler tool-bar+ totd yascroll cython-mode move-dup move-text autofit-frame emacs-setup fix-input frame-cmds frame-fns frame-mode frame-tag framemove frames-only-mode free-keys org-protocol-jekyll hledger-mode hide-comnt hide-lines hide-region hideshow-org helm helm-anything helm-bind-key helm-books helm-chrome helm-commandlinefu helm-describe-modes helm-fuzzier helm-git helm-git-grep helm-gitlab helm-orgcard helm-proc helm-project-persist helm-spotify helm-spotify-plus helm-systemd helm-themes helm-xref ace-mc centered-cursor-mode evil-mc mc-extras dired-narrow websocket win-switch window+ window-jump window-layout window-purpose tablist auto-org-md autobookmarks calfw calfw-gcal counsel-osx-app imenu-anywhere ivy-gitlab ivy-todo orgtbl-aggregate orgtbl-join orgtbl-show-header origami osx-browse osx-clipboard osx-lib osx-org-clock-menubar codebug operate-on-number org-dotemacs org-easy-img-insert org-ehtml org-repo-todo org-sticky-header outline-magic zeal-at-point yard-mode yaml-mode xpm workgroups2 wgrep web-mode visual-fill-column vimrc-mode use-package unityjs-mode toml-mode tide swift-mode stylus-mode stripe-buffer smex smartparens smart-forward slime shader-mode shackle sass-mode ruby-refactor rspec-mode rotate-text repl-toggle realgud rainbow-mode rainbow-delimiters racer quickrun pug-mode processing-mode powerline pip-requirements phpunit php-refactor-mode php-extras php-boris persistent-soft pcre2el ox-pandoc orglink org2jekyll org-wc org-tree-slide org-transform-tree-table org-tracktable org-time-budgets org-table-sticky-header org-table-comment org-seek org-review org-recent-headings org-random-todo org-preview-html org-plus-contrib org-parser org-mac-link org-journal org-jekyll org-gcal org-fstree org-download org-doing org-dashboard org-context org-cliplink org-capture-pop-frame org-bullets org-bookmark-heading org-board org-beautify-theme org-babel-eval-in-repl org-attach-screenshot org-alert org-agenda-property org-ac openwith opencl-mode omnisharp occur-context-resize ob-sql-mode ob-ipython ob-browser ob-async nose nodejs-repl nlinum neotree nasm-mode moonscript modern-cpp-font-lock mips-mode meghanada markdown-toc less-css-mode julia-mode jsx-mode json-mode js2-refactor irony-eldoc impatient-mode imenu-list ido-vertical-mode highlight-quoted highlight-numbers highlight-indentation help-fns+ haxor-mode haskell-mode hack-mode groovy-mode goto-last-change gorepl-mode google-this go-eldoc glsl-mode gitignore-mode gitconfig-mode git-messenger git-gutter-fringe flycheck-rust flycheck-pos-tip flycheck-irony flx-ido fancy-narrow exec-path-from-shell esup ert-runner ensime emr emmet-mode elmacro eldoc-eval editorconfig dumb-jump doom-theme dockerfile-mode disaster dired-k demangle-mode dash-at-point cuda-mode crystal-mode company-web company-tern company-statistics company-sourcekit company-shell company-restclient company-racer company-quickhelp company-lua company-irony-c-headers company-irony company-inf-ruby company-go company-dict company-ansible company-anaconda command-log-mode coffee-mode cmake-mode browse-at-remote auto-yasnippet auto-compile applescript-mode android-mode all-the-icons ace-link)))
	(setq use-package-enable-imenu-support t)
	(setq use-package-verbose t)

	(setq helm-M-x-always-save-history t)
	(setq helm-adaptive-mode t)
	(setq helm-allow-mouse nil)
	(setq helm-autoresize-mode t)

	(setq jdee-db-active-breakpoint-face-colors (cons "#0d0f11" "#41728e"))
	(setq jdee-db-requested-breakpoint-face-colors (cons "#0d0f11" "#b5bd68"))
	(setq jdee-db-spec-breakpoint-face-colors (cons "#0d0f11" "#585858"))

	(setq org-projectile:allow-tramp-projects t)
	(setq org-projectile:projects-file "/home/ub2/org/Projects/TODO.org")
	(setq projectile-cache-file "/home/ub2/.emacs.d/private/cache/SERVER2/projectile.cache")
	(setq projectile-completion-system (quote helm))
	(setq projectile-enable-caching t)
	(setq projectile-file-exists-remote-cache-expire nil)
	(setq projectile-globally-ignored-files (quote ("Icon" "TAGS" "*.pyc")))
	(setq projectile-require-project-root nil)
	(setq projectile-sort-order (quote modification-time))
	(setq projectile-switch-project-action (quote doom/wg-projectile-switch-project))

	(setq global-semantic-highlight-func-mode t)
	(setq semantic-mode t)
	(setq semantic-stickyfunc-indent-string "")

	(setq explicit-shell-file-name "/usr/local/bin/zsh")

	(setq python-shell-completion-native-enable t)
	(setq python-shell-interpreter-args "")
	(setq python-shell-prompt-block-regexp "\\.\\.\\.\\.: ")
	(setq python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: ")
	(setq python-shell-prompt-regexp "In \\[[0-9]+\\]: ")
	(setq python-shell-virtualenv-root "~/.virtualenvs/dev")

	(setq vc-annotate-background "#000000")
	(setq vc-annotate-color-map
		(quote
			((20 . "#B6E63E")
			 (40 . "#c4db4e")
			 (60 . "#d3d15f")
			 (80 . "#E2C770")
			 (100 . "#ebb755")
			 (120 . "#f3a73a")
			 (140 . "#FD971F")
			 (160 . "#fb713a")
			 (180 . "#fa4b56")
			 (200 . "#F92672")
			 (220 . "#f33260")
			 (240 . "#ed3f4e")
			 (260 . "#E74C3C")
			 (280 . "#dd6a60")
			 (300 . "#d38885")
			 (320 . "#c9a6aa")
			 (340 . "#C0C5CF")
			 (360 . "#C0C5CF"))))
	(setq vc-annotate-very-old-color nil)
	(setq vc-follow-symlinks nil)
	(setq vc-make-backup-files nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1B2229" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#DFDFDF"])
 '(custom-safe-themes
   (quote
    ("63b822ccd7a1928a7cbc88037dddf7b74b2f8a507e1bccd7281f20646f72cd0a" "d37b6fc3ea627226e0a703f3b97f18e42d5a58c293a7d34c2483688f72e66ccf" "9f3181dc1fabe5d58bbbda8c48ef7ece59b01bed606cfb868dd147e8b36af97c" "227e2c160b0df776257e1411de60a9a181f890cfdf9c1f45535fc83c9b34406b" "e91ca866d6cbb79786e314e0466f4f1b8892b72e77ed702e53bf7565e0dfd469" "18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "6bde11b304427c7821b72a06a60e8d079b8f7ae10b407d8af37ed5e5d59b1324" "e146feef4c2f5abc6140e40f69d75b05cb27ae56644b6f9ced362416090bed1d" default)))
 '(fci-rule-color "#5B6268" t)
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef") t)
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65") t)
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3B3F46") t)
 '(org-ellipsis "  ")
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(vc-annotate-background "#1B2229" t)
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#ce6061")
    (cons 300 "#9d5558")
    (cons 320 "#6c4a4f")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")) t)
 '(vc-annotate-very-old-color nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
