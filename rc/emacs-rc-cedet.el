;;; emacs-rc-cedet.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(setq semanticdb-default-save-directory "~/emacs/.emacs-semanticdb") ; getting rid of semantic.caches

(semantic-load-enable-excessive-code-helpers)

(global-srecode-minor-mode 1)
(global-semantic-mru-bookmark-mode 1)

(require 'semantic-decorate-include)

;; gcc setup
(require 'semantic-gcc)

;; smart complitions
(require 'semantic-ia)

(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local erlang-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

(require 'eassist)


;; customisation of modes
(defun alexott/cedet-hook ()
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
;; (add-hook 'semantic-init-hooks 'alexott/cedet-hook)
(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'scheme-mode-hook 'alexott/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'erlang-mode-hook 'alexott/cedet-hook)

(defun alexott/c-mode-cedet-hook ()
 ;; (local-set-key "." 'semantic-complete-self-insert)
 ;; (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

(custom-set-variables
 '(semantic-idle-scheduler-idle-time 3)
 '(semantic-self-insert-show-completion-function (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes)))

;; ctags
(require 'semanticdb-ectag)
(semantic-load-enable-primary-exuberent-ctags-support)

;;
(semantic-add-system-include "/opt/ri/include" 'c++-mode)
(semantic-add-system-include "/opt/ri/include" 'c-mode)

(setq boost-base-directory "/opt/ri/include")

(add-to-list 'semantic-lex-c-preprocessor-symbol-file
             (concat boost-base-directory "/boost/config.hpp"))

;;
(global-semantic-idle-tag-highlight-mode 1)

;;; emacs-rc-cedet.el ends here

