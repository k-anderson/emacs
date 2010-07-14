;; Load Cedet
(load-file (concat emacs-dir "/vendor/cedet/common/cedet.el"))

(setq semanticdb-default-save-directory (concat emacs-dir "/.emacs-semanticdb")) ; getting rid of semantic.caches

;; (semantic-load-enable-code-helpers)
(semantic-load-enable-excessive-code-helpers)

;; ede
(require 'semantic-lex-spp)
(global-ede-mode t) ; enable ede mode

(global-semantic-mru-bookmark-mode 1)

;; (require 'semantic-decorate-include)

;; smart complitions
(require 'semantic-ia)

;; gcc setup
(require 'semantic-gcc)

;; (setq-mode-local c-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))
;; (setq-mode-local c++-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))
;; (setq-mode-local erlang-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))

(require 'eassist)

;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)

;; (add-hook 'semantic-init-hooks 'alexott/cedet-hook)
;; (add-hook 'c-mode-common-hook 'alexott/cedet-hook)
;; (add-hook 'lisp-mode-hook 'alexott/cedet-hook)
;; (add-hook 'scheme-mode-hook 'alexott/cedet-hook)
;; (add-hook 'emacs-lisp-mode-hook 'alexott/cedet-hook)
;; (add-hook 'erlang-mode-hook 'alexott/cedet-hook)

;; (defun alexott/c-mode-cedet-hook ()
;;   ;; (local-set-key "." 'semantic-complete-self-insert)
;;   ;; (local-set-key ">" 'semantic-complete-self-insert)
;;   (local-set-key "\C-ct" 'eassist-switch-h-cpp)
;;   (local-set-key "\C-xt" 'eassist-switch-h-cpp)
;;   (local-set-key "\C-ce" 'eassist-list-methods)
;;   (local-set-key "\C-c\C-r" 'semantic-symref)
;;   )
;; (add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

;; (custom-set-variables
;;  '(semantic-idle-scheduler-idle-time 3)
;;  '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
;;  '(global-semantic-tag-folding-mode t nil (semantic-util-modes)))

;; ctags
(require 'semanticdb-ectag)
(semantic-load-enable-primary-exuberent-ctags-support)

;; add as many system include as necessary
;; (semantic-add-system-include "/opt/ri/include" 'c++-mode)
;; (semantic-add-system-include "/opt/ri/include" 'c-mode)

;; (setq boost-base-directory "/opt/ri/include")

;; (add-to-list 'semantic-lex-c-preprocessor-symbol-file
;;              (concat boost-base-directory "/boost/config.hpp"))

;;
(global-semantic-idle-tag-highlight-mode 1)

;; Load other files..
(load (concat emacs-dir "rc/cedet/hooks.el"))

