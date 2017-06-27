;;; custom-quick_refiling.el --- description

(defun my/refile (file headline &optional arg)
  (let ((pos (save-excursion
               (find-file file)
               (org-find-exact-headline-in-buffer headline))))
    (org-refile arg nil (list headline file nil pos)))
  (switch-to-buffer (current-buffer)))

(defmacro my/make-org-refile-hydra (hydraname file keyandheadline)
  "Make a hydra named HYDRANAME with refile targets to FILE.
KEYANDHEADLINE should be a list of cons cells of the form (\"key\" . \"headline\")"
  `(defhydra ,hydraname (:color blue :after-exit (my/org-refile-hydra/body))
     ,file
     ,@(cl-loop for kv in keyandheadline
		collect (list (car kv) (list 'my/refile file (cdr kv)) (cdr kv)))
     ("q" nil "cancel")))

(my/make-org-refile-hydra my/org-refile-hydra-file-1
			    "~/org/collections/business.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-2
			    "~/org/collections/dev.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-4
			    "~/org/collections/documents.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-5
			    "~/org/collections/emacs.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")
			     ("3" . "To Learn")))
(my/make-org-refile-hydra my/org-refile-hydra-file-3
			    "~/org/collections/devices.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-6
			    "~/org/collections/health.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-7
			    "~/org/collections/keybindings.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-8
			    "~/org/collections/ledger.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-9
			    "~/org/collections/networking.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-10
			    "~/org/collections/people.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-11
			    "~/org/collections/projects.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-12
			    "~/org/collections/services.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-13
			    "~/org/collections/wiki.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))
(my/make-org-refile-hydra my/org-refile-hydra-file-14
			    "~/org/collections/me.org"
			    (("1" . "Inbox")
			     ("2" . "To Do")))

(defhydra my/org-refile-hydra (:foreign-keys run)
  "Refile"
  ("b" my/org-refile-hydra-file-1/body "business" :exit t)
  ("d" my/org-refile-hydra-file-2/body "dev" :exit t)
  ("D" my/org-refile-hydra-file-3/body "devices" :exit t)
  ("f" my/org-refile-hydra-file-4/body "documents" :exit t)
  ("e" my/org-refile-hydra-file-5/body "emacs" :exit t)
  ("h" my/org-refile-hydra-file-6/body "health" :exit t)
  ("k" my/org-refile-hydra-file-7/body "keybindings" :exit t)
  ("l" my/org-refile-hydra-file-8/body "ledger" :exit t)
  ("m" my/org-refile-hydra-file-14/body "me" :exit t)
  ("n" my/org-refile-hydra-file-9/body "networking" :exit t)
  ("o" my/org-refile-hydra-file-10/body "people" :exit t)
  ("p" my/org-refile-hydra-file-11/body "projects" :exit t)
  ("s" my/org-refile-hydra-file-12/body "services" :exit t)
  ("w" my/org-refile-hydra-file-13/body "wiki" :exit t)
  ("q" nil "cancel"))

(global-set-key (kbd "<f9>") nil)
(global-set-key (kbd "<f9> r") 'my/org-refile-hydra/body)
(provide 'custom-quick_refiling)
;;; custom-quick_refiling.el ends here
