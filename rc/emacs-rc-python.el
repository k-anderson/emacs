;;; emacs-rc-python.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alanclic@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; customisation of cc-mode
(defun alancastro/python-common-hook ()
  ;; style customization
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 2)
  ;; local keys
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-common-hook)
(add-hook 'c-mode-common-hook 'alexott/common-hook)
(add-hook 'c-mode-common-hook 'alexott/show-prog-keywords)
;;; emacs-rc-cmode.el ends here
