(add-to-list 'load-path (concat emacs-dir "vendor/django-mode"))

(require 'django-html-mode)
(require 'django-mode)
(yas/load-directory (concat emacs-dir "vendor/django-mode/snippets"))
;; (add-to-list 'auto-mode-alist '("\\.html$" . django-html-mode))