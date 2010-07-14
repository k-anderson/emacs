;;===== PyFlakes
;; code checking via pyflakes+flymake
(defun flymake-pyflakes-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     ;;                       'flymake-create-temp-inplace))
                     'flymake-custom-create-temp-file))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "pyflakes" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init))

(add-hook 'python-mode-hook (lambda () (flymake-mode 1)))
