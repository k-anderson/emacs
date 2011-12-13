;; Remove Annoyances
(setq inhibit-startup-message t)  ;; inhibit startup messages
(setq require-final-newline t)    ;; make the last line end in a carriage return
(fset 'yes-or-no-p 'y-or-n-p)     ;; allow just "y" instead of "yes" on exit
(setq next-line-add-newlines nil) ;; disallow creation of new lines on  "arrow-down key" at end of the buffer
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)

;; General Embellishments
;; (global-set-key (kbd "C-z") 'undo)
(menu-bar-mode -1)
(setq font-lock-maximum-decoration t)
(global-set-key "\M-g" 'goto-line)
(global-set-key [f1]     'revert-buffer)
(global-set-key [f11]    'auto-save-mode)
;;(highlight-tabs)
;;(highlight-trailing-whitespace)
;!!!(windmove-default-keybindings 'meta)
(line-number-mode 1)
;!! (cua-mode t)

;; Show paren
(require 'paren)
(show-paren-mode t)

;; Take care of tabs
(setq c-basic-indent 2)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)

;; C-mode Embellishments
(setq kill-whole-line t)      ;; Make ctrl-k kill an entire line if cursor at the beginning
(setq c-hungry-delete-key t)  ;;will delete "hungrily" in C mode

;; Moving cursor down at bottom scrolls only a single line, not half page
(setq scroll-step 1)
(setq scroll-conservatively 5)
(global-set-key [delete] 'delete-char)

;; Backup files and auto-saves
;; (setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/emacs-backup"))))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;!! (define-key input-decode-map "\e\M-[D" [(meta left)])
;!! (define-key input-decode-map "\e\M-[C" [(meta right)])
