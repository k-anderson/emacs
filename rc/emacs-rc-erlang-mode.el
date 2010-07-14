;; erlang-mode configuration
;; change this directory  to your Erlang root dir.
(setq erlang-root-dir "/opt/erlang")

;; customisation of cc-mode
(defun alancastro/erlang-mode-common-hook ()
  ;; style customization
  ;;(c-set-offset 'member-init-intro '++)
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  ;;(c-set-offset 'substatement-open 0)
  ;;(c-set-style "bsd")
  (setq c-basic-offset 2)
  ;;(c-toggle-auto-hungry-state 0)
  ;; minor modes
  ;;(c-turn-on-eldoc-mode)
  ;;(gtags-mode 1)
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

    (add-hook 'erlang-mode-common-hook 'alancastro/erlang-mode-common-hook)

    )
  )
