;; Load tabbar
(load-file (concat emacs-dir "vendor/tabbar/tabbar.el"))

(tabbar-mode)
;; (tabbar-mwheel-mode 0)
(global-set-key [(meta left)] 'tabbar-backward)
; (global-set-key (kbd "C-M-[ d") 'tabbar-backward)
(global-set-key [(meta right)] 'tabbar-forward)
