(load-file (concat emacs-dir "vendor/markdown/markdown-mode.el"))
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))