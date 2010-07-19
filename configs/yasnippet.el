;; -- yasnippet
(add-to-list 'load-path (concat emacs-dir "/vendor/yasnippet"))

(require 'yasnippet) ;; not yasnippet-bundle
(setq yas/trigger-key "<backtab>")
(yas/initialize)
(setq yasnippet-dir (concat emacs-dir "/vendor/yasnippet/snippets"))
(yas/load-directory yasnippet-dir)

;; hook for automatic reloading of changed snippets
(defun update-yasnippets-on-save ()
  (when (string-match "/yasnippet/snippets" buffer-file-name)
    (yas/load-directory yasnippet-dir)))
(add-hook 'after-save-hook 'update-yasnippets-on-save)