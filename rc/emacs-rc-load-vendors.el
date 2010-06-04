;;load all third parties here.

;;(setq emacs-dir (file-name-directory (file-truename (or load-file-name buffer-file-name))))

(load-file (concat emacs-dir "/vendor/theme-irblack/color-theme-irblack.el"))
(load-file (concat emacs-dir "/vendor/cedet/common/cedet.el"))
(load-file (concat emacs-dir "/vendor/eldoc/eldoc.el"))
(add-to-list 'load-path (concat emacs-dir "/vendor/yasnippet"))
(load-file (concat emacs-dir "/vendor/textile/textile-mode.el"))
(load-file (concat emacs-dir "/vendor/php/php-mode.el"))

