(add-to-list 'load-path (concat emacs-dir "vendor/python/python-mode"))
(add-to-list 'load-path (concat emacs-dir "vendor/python/Pymacs"))

(require 'python-mode)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;;(eval-after-load "pymacs"

(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(load (concat emacs-dir "rc/python-mode/hooks.el"))
(load (concat emacs-dir "rc/python-mode/flymake.el"))
