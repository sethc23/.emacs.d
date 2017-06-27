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
	      module-neotree_mods  ; minor customizations
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
	      custom-db          ; emacs as a db browser/client
	      custom-debug       ; nigh-universal debugging
	      ;; custom-demo        ; allow me to demonstrate...
	      ;; custom-screeps     ; The programmer MMO
	      custom-tags        ; if you liked it you should've generated a tag for it
	      custom-tmux        ; close the rift between GUI & terminal
	      ;; custom-write       ; Emacs as a word processor

	  ;; Personal settings

		  custom-move_text
		  custom-general_functions
		  custom-key_macros
		  ;;  custom-quick_refiling
		  ;; custom-org_babel_tangle_hooks

	      ;; my-commands
	      my-bindings
	)

(setq custom-file "~/.emacs.d/custom-settings.el")
(load custom-file t)

;; Prompt about unsaved customizations at termination
;(add-hook 'kill-emacs-query-functions
;          'custom-prompt-customize-unsaved-options)

   ;; change mode-line color by evil state
   (lexical-let ((default-color (cons (face-background 'mode-line)
                                      (face-foreground 'mode-line))))
     (add-hook 'post-command-hook
       (lambda ()
         (let ((color (cond ((minibufferp) default-color)
                            ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                            ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                            ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                            (t default-color))))
           (set-face-background 'mode-line (car color))
           (set-face-foreground 'mode-line (cdr color))))))
