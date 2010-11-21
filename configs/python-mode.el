(add-to-list 'load-path (concat emacs-dir "vendor/python/python-mode"))
(add-to-list 'load-path (concat emacs-dir "vendor/python/pymacs"))

(require 'python-mode)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; pymacs
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; ;;(eval-after-load "pymacs"

;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

;; --commons
(add-hook 'python-mode-hook 'commons/common-hook)
(add-hook 'python-mode-hook 'commons/show-prog-keywords)

(add-to-list 'commons/trailing-whitespace-modes "python-mode")
(add-to-list 'commons/untabify-modes "python-mode")

;; --hooks
(defun python-mode/hook ()

  (auto-complete-mode t)

  ;; style customization
  (setq tab-width 4)
  (setq py-indent-offset 4)
  (setq py-smart-indentation nil)
  (setq indent-tabs-mode nil)

  ;;(setq yas/fallback-behavior 'call-other-command)

  ;; local keys
  (local-set-key [return] 'newline-and-indent)

  )

(remove-hook 'python-mode-hook 'wisent-python-default-setup)
(add-hook 'python-mode-hook 'python-mode/hook)

;; --flymake
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake/create-temp-file))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list (concat emacs-dir "vendor/python/flymake/pychecker")  (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks '("\\.py\\'" flymake-pyflakes-init flymake/cleanup))
  )
