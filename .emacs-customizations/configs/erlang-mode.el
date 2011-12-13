;; erlang-mode configuration
;; change this directory  to your Erlang root dir.
(setq erlang-root-dir "/usr/lib/erlang")

;; customisation of cc-mode
(defun erlang-mode/common-hook ()
  ;; style customization
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 2)

  ;; local keys
  (local-set-key [return] 'newline-and-indent)
  )

(defun erlang-machine-name ()
  (format "%s-emacs" user-login-name))

(when (file-directory-p erlang-root-dir)
  (when (file-directory-p (concat erlang-root-dir "/lib/tools-2.6.6.5/emacs"))

    (setq load-path (cons (concat erlang-root-dir "/lib/tools-2.6.6.5/emacs") load-path))
    (setq exec-path (cons (concat erlang-root-dir "/bin") exec-path))
    (require 'erlang-start)

    ;; when starting an Erlang shell in Emacs, the node name
    ;; by default should be "emacs"
    (setq inferior-erlang-machine-options '("-name" "emacs"))

    (add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
    (add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

    (add-hook 'erlang-mode-common-hook 'erlang-mode/common-hook)

    )
  )

;; --flymake
(load-file (concat erlang-root-dir "/lib/tools-2.6.6.5/emacs/erlang-flymake.el"))

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

;; This is needed for Distel setup
(let ((distel-dir (concat emacs-dir "vendor/distel/elisp")))
  (unless (member distel-dir load-path)
    ;; Add distel-dir to the end of load-path
    (setq load-path (append load-path (list distel-dir)))))

(require 'distel)
(distel-setup)

;; Some Erlang customizations
(add-hook 'erlang-mode-hook
          (lambda ()
            ;; when starting an Erlang shell in Emacs, default in the node name
            (setq inferior-erlang-machine-options '("-name" "emacs"))
            ;; add Erlang functions to an imenu menu
            (imenu-add-to-menubar "imenu")))

;; A number of the erlang-extended-mode key bindings are useful in the shell too
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind)
    ("\M-*"      erl-find-source-unwind)
    )
  "Additional keys to bind when in Erlang shell.")

(add-hook 'erlang-shell-mode-hook
          (lambda ()
            ;; add some Distel bindings to the Erlang shell
            (dolist (spec distel-shell-keys)
              (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(defun erl-shell-with-flags (flags)
  "Start an erlang shell with flags"
  (interactive (list (read-string "Flags: ")))
  (set 'inferior-erlang-machine-options (split-string flags))
  (erlang-shell))

(global-set-key "\C-c\C-z" 'erl-shell-with-flags)