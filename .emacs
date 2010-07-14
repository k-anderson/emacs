;;; I want to enter the debugger on any error and see a
;;; backtrace. This is first in the file so I get a hint where any
;;; errors later on are.
(setq debug-on-error t)

;; Sets emacs-dir to the current directory where .emacs is placed in.
(setq emacs-dir (file-name-directory (file-truename (or load-file-name buffer-file-name))))

;; Modules
;; To habilitate a module just include it's rc file.

;; Commons (Required module)
(load (concat emacs-dir "rc/commons/commons.el"))

;; Misc Module
(load (concat emacs-dir "rc/misc/misc.el"))

;; Yasnippet Module
(load (concat emacs-dir "rc/yasnippet/yasnippet.el"))

;; Flymake Module
(load (concat emacs-dir "rc/flymake/flymake.el"))

;; Cedet Module
(load (concat emacs-dir "rc/cedet/cedet.el"))

;; Auto-complete Module
(load (concat emacs-dir "rc/auto-complete/auto-complete.el"))

;; Org-mode Module
(load (concat emacs-dir "rc/org-mode/org-mode.el"))

;; Textile mode module
(load (concat emacs-dir "rc/textile-mode/textile-mode.el"))

;; Elisp mode module
(load (concat emacs-dir "rc/elisp-mode/elisp-mode.el"))

;; Python mode module
(load (concat emacs-dir "rc/python-mode/python-mode.el"))

;; ;; --[Load all vendors]----------------------------------------------------------------------------------------
;; (load (concat emacs-dir "rc/emacs-rc-load-vendors.el"))

;; ;; Cedet conf
;; (load (concat emacs-dir "rc/emacs-rc-cedet.el"))

;; ;; --[Load editing mode confs]----------------------------------------------------------------------------------------

;; ;; CCMode customization
;; (load (concat emacs-dir "rc/emacs-rc-cc-mode-defs.el"))
;; (load (concat emacs-dir "rc/emacs-rc-cc-mode.el"))
;; (load (concat emacs-dir "rc/emacs-rc-cc-mode-flymake.el"))

;; ;; PHP mode
;; (load (concat emacs-dir "rc/emacs-rc-php-mode.el"))
;; (load (concat emacs-dir "rc/emacs-rc-php-mode-flymake.el"))

;; ;; Erlang mode
;; (load (concat emacs-dir "rc/emacs-rc-erlang-mode.el"))
;; (load (concat emacs-dir "rc/emacs-rc-erlang-mode-flymake.el"))

;; ;; Java mode
;; (load (concat emacs-dir "rc/emacs-rc-java-mode.el"))
;; (load (concat emacs-dir "rc/emacs-rc-java-mode-flymake.el"))

;; ;; Python mode
;; (load (concat emacs-dir "rc/emacs-rc-python-mode.el"))
;; (load (concat emacs-dir "rc/emacs-rc-python-mode-flymake.el"))

;; ;; --[Custom preferences]----------------------------------------------------------------------------------------

;; ;; Load cc-mode customizations
;; (when (file-exists-p (concat emacs-dir "rc/emacs-rc-cc-mode-custom.el"))
;;   (load (concat emacs-dir "rc/emacs-rc-cc-mode-custom.el"))
;; )

;; ;; Automatic
