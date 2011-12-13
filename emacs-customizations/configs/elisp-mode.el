;; --commons
(add-hook 'emacs-lisp-mode-hook 'commons/common-hook)
(add-hook 'emacs-lisp-mode-hook 'commons/show-prog-keywords)

(add-to-list 'commons/trailing-whitespace-modes "emacs-lisp-mode")
(add-to-list 'commons/untabify-modes "emacs-lisp-mode")

;; --cedet
(add-hook 'emacs-lisp-mode-hook 'cedet/hook)
