;;;; flymake customizations
(require 'flymake)

;; TODO: Document that eflymake must use the interpreter pointer by the erlang-root-dir, that's how I fixed the include_lib error problem.

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     ;;'flymake-create-temp-inplace))
                     'flymake-custom-create-temp-file))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list (concat emacs-dir "vendor/erlang/eflymake") (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init flymake-custom-cleanup))

(defun my-erlang-mode-hook ()
  (flymake-mode 1))
(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)