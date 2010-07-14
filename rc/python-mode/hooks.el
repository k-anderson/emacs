(defun alancastro/python-mode-hook ()

  (auto-complete-mode t)

  ;; style customization
  (setq tab-width 2)
  (setq py-indent-offset 2)
  (setq py-smart-indentation nil)
  (setq indent-tabs-mode nil)

  ;; local keys
  (local-set-key [return] 'newline-and-indent)

  )

(add-hook 'python-mode-hook 'alancastro/python-mode-hook)