;; Load Cedet
(load-file (concat emacs-dir "vendor/cedet/common/cedet.el"))

(setq semanticdb-default-save-directory (concat emacs-dir "/.emacs-semanticdb")) ; getting rid of semantic.caches

(semantic-load-enable-excessive-code-helpers)

;; ede
(require 'semantic-lex-spp)
(global-ede-mode t) ; enable ede mode

(global-semantic-mru-bookmark-mode 1)

;; smart complitions
(require 'semantic-ia)

;; (setq-mode-local erlang-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))

(require 'eassist)

(add-hook 'semantic-init-hooks 'cedet/hook)

;; ctags
(require 'semanticdb-ectag)
(semantic-load-enable-primary-exuberent-ctags-support)

;;
(global-semantic-idle-tag-highlight-mode 1)

;; customisation of modes
(defun cedet/hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  )