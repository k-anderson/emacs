(defun org-mode/common-hook ()
  ;; style customization
  (setq tab-width 2)
  (setq indent-tabs-mode nil)

  ;; local keys
  (local-set-key "\C-cl" 'org-store-link)
  (local-set-key "\C-ca" 'org-agenda)
  (local-set-key "\C-cb" 'org-iswitchb)
  )

(add-hook 'org-mode-hook 'org-mode/common-hook)
(setq org-log-done t)

(setq org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s!)" "|" "DONE(d!/!)")
                                (sequence "WAITING(w@/!)" "SOMEDAY(S!)" "OPEN(O@)" "|" "CANCELLED(c@/!)")
                                (sequence "QUOTE(q!)" "QUOTED(Q!)" "|" "APPROVED(A@)" "EXPIRED(E@)" "REJECTED(R@)"))))

(setq org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
                                     ("STARTED" :foreground "blue" :weight bold)
                                     ("DONE" :foreground "forest green" :weight bold)
                                     ("WAITING" :foreground "orange" :weight bold)
                                     ("SOMEDAY" :foreground "magenta" :weight bold)
                                     ("CANCELLED" :foreground "forest green" :weight bold)
                                     ("QUOTE" :foreground "red" :weight bold)
                                     ("QUOTED" :foreground "magenta" :weight bold)
                                     ("APPROVED" :foreground "forest green" :weight bold)
                                     ("EXPIRED" :foreground "forest green" :weight bold)
                                     ("REJECTED" :foreground "forest green" :weight bold)
                                     ("OPEN" :foreground "blue" :weight bold))))

(setq org-use-fast-todo-selection t)

(add-to-list 'commons/trailing-whitespace-modes "org-mode")
(add-to-list 'commons/untabify-modes "org-mode")