(add-to-list 'load-path (concat emacs-dir "vendor/auto-complete"))
(require 'auto-complete)

(add-to-list 'ac-dictionary-directories (concat emacs-dir "vendor/auto-complete/dict"))

(require 'auto-complete-config)
(ac-config-default)