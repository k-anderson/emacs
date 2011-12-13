(load-file (concat emacs-dir "vendor/textile/textile-mode.el"))
(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))