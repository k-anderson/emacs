;;; emacs-rc-python-mode.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alanclic@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; customisation of cc-mode
(defun alancastro/python-mode-common-hook ()
  ;; style customization
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  (setq py-indent-offset 2)
  (setq python-indent 2)
  ;; local keys
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'python-mode-hook 'alancastro/python-mode-common-hook)
(add-hook 'python-mode-hook 'alexott/common-hook)
(add-hook 'python-mode-hook 'alexott/show-prog-keywords)
;;; emacs-rc-cmode.el ends here
