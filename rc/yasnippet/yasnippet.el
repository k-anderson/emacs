(add-to-list 'load-path (concat emacs-dir "/vendor/yasnippet"))

(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(setq alancastro/yasnippet-dir (concat emacs-dir "/vendor/yasnippet/snippets"))
(yas/load-directory alancastro/yasnippet-dir)

;; hook for automatic reloading of changed snippets
(defun alancastro/update-yasnippets-on-save ()
  (when (string-match "/yasnippet/snippets" buffer-file-name)
    (yas/load-directory alancastro/yasnippet-dir)))

(add-hook 'after-save-hook 'alancastro/update-yasnippets-on-save)
