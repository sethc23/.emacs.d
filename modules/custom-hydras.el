;;; custom-hydras.el --- description

(defun my/reload  ()
  (progn
    'turn-off-evil-mode
    (whitespace-mode nil)
  )
)

(defhydra my/agenda-set-files (:foreign-keys
                           :color pink
                           :hint nil)
  "


^Agenda File Sets^
^^^^^^^^----------------------------------------------------
_1_: all



"
  ("1"
   (progn
    (load-library "find-lisp")
    (setq org-agenda-files
      (find-lisp-find-files "~/org/collections" "\.org$"))
    (setq org-agenda-files (append '("~/org/organizer.org") org-agenda-files))
    (setq org-agenda-files (append '("~/org/seth.t.chase@gmail.com.org") org-agenda-files))
    ;;(setq org-agenda-files (append '("~/org/seth.diary") org-agenda-files))
    ;;(setq org-agenda-files (append '("~/org/organizer.org") org-agenda-files))
    ;;(org-agenda-file-to-front &optional TO-END)
    )
   :exit t)
  ("q" nil "cancel"))


(defun my/calendar-load  ()
   (progn
    (require 'org-gcal)
    (org-gcal-fetch)
    (org-gcal-sync)
    ;;(sit-for 2)
    (require 'calfw-ical)
    (cfw:open-calendar-buffer)
  )
)
(defun my/agenda-load  ()
   (progn
    ;;(org-agenda)
    ;;(org-agenda-file-to-front)

    (org-agenda-list)
    (sit-for 2)
    (hide-everything)
    ;;(delete-other-windows)


    ;;(sit-for 3)
    ;; (org-agenda-goto-today)
    (org-agenda-day-view)

    ;; TO ADD
    ;;(org-agenda-month-view)
    (org-agenda-phases-of-moon t)
    (org-agenda-holidays t)
    (org-agenda-sunrise-sunset t)

    ;;(sit-for 3)
    (org-agenda-log-mode)

    (org-agenda-columns)
    ;;(sit-for 3)
    ;;(org-agenda-write "~/org/.export/org-agenda-today.html")
    ;;(kill-emacs)

    (org-agenda-redo)

  )
)

(defhydra my/custom-hydra (:foreign-keys
                           :color pink
                           :hint nil)
  "


^Environ^                  ^Filing^           ^Planning^
^^^^^^^^----------------------------------------------------
_l_: reload                _r_: refile
_s_: set agenda files
_c_: load calendar
_a_: load agenda


"
  ("r" my/org-refile-hydra/body :exit t)
  ("l" (my/reload) :exit t)
  ("s" (my/agenda-set-files/body) :exit t)
  ("c" (my/calendar-load)  :exit t)
  ("a" (my/agenda-load) :exit t)
  ("q" nil "cancel"))

(global-set-key (kbd "<f9>") nil)
(global-set-key (kbd "<f9>") 'my/custom-hydra/body)

(global-set-key (kbd "C-c e") 'turn-off-evil-mode)

(provide 'custom-hydras)
;;; custom-hydras.el ends here
