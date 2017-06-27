(deftheme doom-custom-two
  "Created 2017-06-05.")

(custom-theme-set-variables
 'doom-custom-two
 '(ansi-color-names-vector ["#0d0f11" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#c7abc7" "#8abeb7" "#ffffff"])
 '(auto-compile-on-save-mode t)
 '(auto-compile-update-autoloads t)
 '(auto-compile-verbose t)
 '(browse-url-browser-function (quote eww-browse-url))
 '(browse-url-chrome-program "google-chrome")
 '(compilation-scroll-output t)
 '(cua-enable-cua-keys (quote shift))
 '(cursor-type (quote bar))
 '(custom-safe-themes (quote ("9f3181dc1fabe5d58bbbda8c48ef7ece59b01bed606cfb868dd147e8b36af97c" "227e2c160b0df776257e1411de60a9a181f890cfdf9c1f45535fc83c9b34406b" "e91ca866d6cbb79786e314e0466f4f1b8892b72e77ed702e53bf7565e0dfd469" "18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "6bde11b304427c7821b72a06a60e8d079b8f7ae10b407d8af37ed5e5d59b1324" "e146feef4c2f5abc6140e40f69d75b05cb27ae56644b6f9ced362416090bed1d" default)))
 '(diary-file "~/org/seth.diary")
 '(doom-neotree-enable-variable-pitch nil)
 '(doom-neotree-line-spacing 1)
 '(enable-recursive-minibuffers t)
 '(eval-expression-print-length nil)
 '(eval-expression-print-level nil)
 '(evil-want-C-u-scroll t)
 '(explicit-shell-file-name "/usr/local/bin/zsh")
 '(font-use-system-font t)
 '(gmm-tool-bar-style (quote retro))
 '(helm-M-x-always-save-history t)
 '(helm-allow-mouse nil)
 '(helm-autoresize-mode t)
 '(hscroll-margin 1)
 '(hscroll-step 1)
 '(immortal-scratch-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-echo-area-message "ub2")
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(make-backup-files nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(neo-auto-indent-point t)
 '(neo-create-file-auto-open t)
 '(neo-mode-line-type (quote neotree))
 '(neo-show-updir-line t)
 '(neo-smart-open t)
 '(neo-theme (quote nerd))
 '(neo-window-width 95)
 '(org-adapt-indentation nil)
 '(org-agenda-dim-blocked-tasks nil)
 '(org-agenda-files (quote ("~/org/seth.org" "~/org/seth.t.chase@gmail.com.org")))
 '(org-agenda-include-diary t)
 '(org-agenda-inhibit-startup t)
 '(org-agenda-window-setup (quote other-frame))
 '(org-babel-hash-show-time t)
 '(org-babel-load-languages (quote ((python . t) (sql . t) (shell . t))))
 '(org-babel-no-eval-on-ctrl-c-ctrl-c nil)
 '(org-babel-shell-names (quote ("sh" "bash" "csh" "ash" "dash" "ksh" "mksh" "posh" "zsh")))
 '(org-capture-templates (quote (("c" "Changelog" entry (file+headline (f-expand "CHANGELOG.org" (doom/project-root)) "Unreleased") "* %?") ("n" "Notes" entry (file+headline org-default-notes-file "Inbox") "* %u %? %i" :prepend t))))
 '(org-capture-use-agenda-date t)
 '(org-confirm-babel-evaluate nil)
 '(org-download-heading-lvl nil)
 '(org-download-image-dir ".attach/")
 '(org-download-screenshot-method "maim --opengl -s %s")
 '(org-download-timestamp "_%Y%m%d_%H%M%S")
 '(org-edit-src-content-indentation 0)
 '(org-ellipsis "  ")
 '(org-export-babel-evaluate (quote inline-only))
 '(org-export-backends (quote (ascii html icalendar latex md org)))
 '(org-export-coding-system (quote utf-8))
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(org-hide-block-startup t)
 '(org-journal-dir "~/org/journal/")
 '(org-recent-headings-candidate-number-limit 5)
 '(org-recent-headings-mode t)
 '(org-src-tab-acts-natively t)
 '(org-startup-indented t)
 '(org-support-shift-select t)
 '(package-enable-at-startup t)
 '(package-hidden-regexps (quote ("^[^~]+.*$" "^~.*")))
 '(package-selected-packages (quote (fold-this hideshowvis yafolding markdown-edit-indirect markdown-mode+ markdown-preview-eww obfusurl immortal-scratch omni-kill omni-log omni-scratch omni-tags persistent-scratch persp-fr persp-mode persp-mode-projectile-bridge persp-projectile scratch scratch-ext scratch-log scratch-pop scratches unkillable-scratch flex-isearch ido-at-point ido-completing-read+ ido-flex-with-migemo ido-grid-mode ido-select-window ido-sort-mtime ido-ubiquitous ido-yes-or-no idomenu cmds-menu menu-bar+ minibuffer-line minimap pianobar ppd-sr-speedbar project-explorer project-local-variables project-persist-drawer project-root project-shells projectile-codesearch projectile-direnv projectile-git-autofetch projectile-speedbar projectile-variable sr-speedbar tabbar tabbar-ruler tool-bar+ totd yascroll cython-mode move-dup move-text autofit-frame emacs-setup fix-input frame-cmds frame-fns frame-mode frame-tag framemove frames-only-mode free-keys org-protocol-jekyll hledger-mode hide-comnt hide-lines hide-region hideshow-org helm helm-anything helm-bind-key helm-books helm-chrome helm-commandlinefu helm-describe-modes helm-fuzzier helm-git helm-git-grep helm-gitlab helm-orgcard helm-proc helm-project-persist helm-spotify helm-spotify-plus helm-systemd helm-themes helm-xref ace-mc centered-cursor-mode evil-mc mc-extras dired-narrow websocket win-switch window+ window-jump window-layout window-purpose tablist auto-org-md autobookmarks calfw calfw-gcal counsel-osx-app imenu-anywhere ivy-gitlab ivy-todo orgtbl-aggregate orgtbl-join orgtbl-show-header origami osx-browse osx-clipboard osx-lib osx-org-clock-menubar codebug operate-on-number org-dotemacs org-easy-img-insert org-ehtml org-repo-todo org-sticky-header outline-magic zeal-at-point yard-mode yaml-mode xpm workgroups2 wgrep web-mode visual-fill-column vimrc-mode use-package unityjs-mode toml-mode tide swift-mode stylus-mode stripe-buffer smex smartparens smart-forward slime shader-mode shackle sass-mode ruby-refactor rspec-mode rotate-text repl-toggle realgud rainbow-mode rainbow-delimiters racer quickrun pug-mode processing-mode powerline pip-requirements phpunit php-refactor-mode php-extras php-boris persistent-soft pcre2el ox-pandoc orglink org2jekyll org-wc org-tree-slide org-transform-tree-table org-tracktable org-time-budgets org-table-sticky-header org-table-comment org-seek org-review org-recent-headings org-random-todo org-preview-html org-plus-contrib org-parser org-mac-link org-journal org-jekyll org-gcal org-fstree org-download org-doing org-dashboard org-context org-cliplink org-capture-pop-frame org-bullets org-bookmark-heading org-board org-beautify-theme org-babel-eval-in-repl org-attach-screenshot org-alert org-agenda-property org-ac openwith opencl-mode omnisharp occur-context-resize ob-sql-mode ob-ipython ob-browser ob-async nose nodejs-repl nlinum neotree nasm-mode moonscript modern-cpp-font-lock mips-mode meghanada markdown-toc less-css-mode julia-mode jsx-mode json-mode js2-refactor irony-eldoc impatient-mode imenu-list ido-vertical-mode highlight-quoted highlight-numbers highlight-indentation help-fns+ haxor-mode haskell-mode hack-mode groovy-mode goto-last-change gorepl-mode google-this go-eldoc glsl-mode gitignore-mode gitconfig-mode git-messenger git-gutter-fringe flycheck-rust flycheck-pos-tip flycheck-irony flx-ido fancy-narrow exec-path-from-shell evil-visualstar evil-textobj-anyblock evil-snipe evil-search-highlight-persist evil-plugins evil-numbers evil-multiedit evil-matchit evil-magit evil-indent-plus evil-exchange evil-escape evil-embrace evil-easymotion evil-commentary evil-args evil-anzu esup ert-runner ensime emr emmet-mode elmacro eldoc-eval editorconfig dumb-jump doom-theme dockerfile-mode disaster dired-k demangle-mode dash-at-point cuda-mode crystal-mode company-web company-tern company-statistics company-sourcekit company-shell company-restclient company-racer company-quickhelp company-lua company-irony-c-headers company-irony company-inf-ruby company-go company-dict company-ansible company-anaconda command-log-mode coffee-mode cmake-mode browse-at-remote auto-yasnippet auto-compile applescript-mode android-mode all-the-icons ace-link)))
 '(persistent-scratch-autosave-mode t)
 '(projectile-cache-file "/home/ub2/.emacs.d/private/cache/SERVER2/projectile.cache")
 '(projectile-completion-system (quote helm))
 '(projectile-enable-caching t)
 '(projectile-file-exists-remote-cache-expire nil)
 '(projectile-globally-ignored-files (quote ("Icon" "TAGS" "*.pyc")))
 '(projectile-require-project-root nil)
 '(projectile-sort-order (quote modification-time))
 '(projectile-switch-project-action (quote doom/wg-projectile-switch-project))
 '(python-shell-interpreter-args "")
 '(python-shell-prompt-block-regexp "\\.\\.\\.\\.: ")
 '(python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: ")
 '(python-shell-prompt-regexp "In \\[[0-9]+\\]: ")
 '(recenter-positions (quote (middle top bottom)))
 '(recenter-redisplay t)
 '(scroll-bar-mode (quote right))
 '(scroll-conservatively 1001)
 '(scroll-preserve-screen-position t)
 '(semantic-stickyfunc-indent-string "")
 '(tab-width 4)
 '(tool-bar-pop-up-mode nil)
 '(tool-bar-position (quote top))
 '(tool-bar-style (quote text))
 '(unkillable-scratch t)
 '(use-package-enable-imenu-support t)
 '(vc-follow-symlinks nil)
 '(vc-make-backup-files nil)
 '(visible-bell t)
 '(visible-cursor nil)
 '(wg-restore-scroll-bars nil)
 '(x-stretch-cursor t)
 '(yas-also-auto-indent-first-line t)
 '(display-time-mode t)
 '(electric-indent-mode nil)
 '(evil-mode nil)
 '(fringe-mode nil)
 '(global-semantic-highlight-func-mode t)
 '(helm-adaptive-mode t)
 '(menu-bar-mode t)
 '(projectile-mode t)
 '(save-place-mode t)
 '(semantic-mode t)
 '(tool-bar-mode t)
 '(transient-mark-mode nil))

(custom-theme-set-faces
 'doom-custom-two
 '(default ((t (:family "Fira Mono" :foundry "CTDB" :slant normal :weight normal :height 90 :width normal)))))

(provide-theme 'doom-custom-two)