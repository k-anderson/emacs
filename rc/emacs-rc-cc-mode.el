;;; emacs-rc-ccmode.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(require 'cc-mode)

;; c include directories
(setq c-eldoc-includes "-I/opt/ri/include -I./ -I../ ")

;; customisation of cc-mode
(defun alexott/c-mode-common-hook ()
  ;; style customization
  (c-set-offset 'member-init-intro '++)
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  (c-set-offset 'substatement-open 0)
  (c-set-style "bsd")
  (setq c-basic-offset 2)
  (c-toggle-auto-hungry-state 0)
  ;; minor modes
  (c-turn-on-eldoc-mode)
  ;;(gtags-mode 1)
  ;; local keys
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-common-hook)
(add-hook 'c-mode-common-hook 'alexott/common-hook)
(add-hook 'c-mode-common-hook 'alexott/show-prog-keywords)
;;; emacs-rc-cmode.el ends here
