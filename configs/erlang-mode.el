;; erlang-mode configuration
;; change this directory  to your Erlang root dir.
(setq erlang-root-dir "/opt/erlang")

;; customisation of cc-mode
(defun erlang-mode/common-hook ()
  ;; style customization
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 2)

  ;; local keys
  (local-set-key [return] 'newline-and-indent)
  )

(when (file-directory-p erlang-root-dir)
  (when (file-directory-p (concat erlang-root-dir "/lib/erlang/lib/tools-2.6.5.1/emacs"))

    (setq load-path (cons (concat erlang-root-dir "/lib/erlang/lib/tools-2.6.5.1/emacs") load-path))
    (setq exec-path (cons (concat erlang-root-dir "/bin") exec-path))
    (require 'erlang-start)

    ;; when starting an Erlang shell in Emacs, the node name
    ;; by default should be "emacs"
    (setq inferior-erlang-machine-options '("-sname" "emacs"))

    (add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
    (add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

    (add-hook 'erlang-mode-common-hook 'erlang-mode/common-hook)

    )
  )

;; --flymake
(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake/create-temp-file))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list (concat emacs-dir "vendor/erlang/eflymake") (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init flymake/cleanup))

(defun my-erlang-mode-hook ()
  (flymake-mode 1))
(add-hook 'erlang-mode-common-hook 'my-erlang-mode-hook)

;; --commons
(add-hook 'erlang-mode-common-hook 'commons/common-hook)
(add-hook 'erlang-mode-common-hook 'commons/show-prog-keywords)

(add-to-list 'commons/trailing-whitespace-modes "erlang-mode")
(add-to-list 'commons/untabify-modes "erlang-mode")

;; --cedet
(add-hook 'erlang-mode-common-hook 'cedet/hook)