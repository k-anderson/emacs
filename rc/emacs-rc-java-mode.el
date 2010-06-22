(add-to-list 'load-path (concat emacs-dir "vendor/java/jdee-2.4.0.1/lisp"))
(add-to-list 'load-path (expand-file-name (concat emacs-dir "vendor/elib-1.0")))

(setq defer-loading-jde nil)

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
            (append
             '(("\\.java\\'" . jde-mode))
             auto-mode-alist)))
  (require 'jde))