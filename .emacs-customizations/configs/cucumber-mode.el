(add-to-list 'load-path (concat emacs-dir "vendor/cucumber-mode"))

;; load bundle snippets
(yas/load-directory (concat emacs-dir "vendor/cucumber-mode/snippets"))

(setq feature-default-language "en")
(setq feature-default-i18n-file (concat emacs-dir "vendor/cucumber-mode/i18n"))
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\\.feature" . feature-mode))