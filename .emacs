;; Sets emacs-dir to the current directory where .emacs is placed in.
(setq emacs-dir "~/workspace/emacs")

;; Load all my personal settings. (rc files)

;; Load all defs for Emacs Ui
(load (concat emacs-dir "/rc/emacs-rc-x.el"))
;; Load all third parties files
(load (concat emacs-dir "/rc/emacs-rc-load-vendors.el"))

;; Theme specific
;; Load current theme (irblack)
(load (concat emacs-dir "/rc/emacs-rc-theme-irblack.el"))

;; Common functions
(load (concat emacs-dir "/rc/emacs-rc-common-functions.el"))

;; Common hooks specific
;; Definitions of common hooks
(load (concat emacs-dir "/rc/emacs-rc-common-hooks.el"))

;; Modes specific
;; CCMode customization
(load (concat emacs-dir "/rc/emacs-rc-cc-mode.el"))
;; Emacs lisp mode customization
(load (concat emacs-dir "/rc/emacs-rc-elisp-mode.el"))
;; Textile mode
(load (concat emacs-dir "/rc/emacs-rc-textile-mode.el"))

;; ------------------------------------------------------------------------------------------

;; Interactively Do Things
(load (concat emacs-dir "/rc/emacs-rc-ido.el"))


;; Cedet conf
(load (concat emacs-dir "/rc/emacs-rc-cedet.el"))

;; Load projects configuration
(load (concat emacs-dir "/rc/emacs-rc-cpp-projects.el"))

;; Flymake conf
(load (concat emacs-dir "/rc/emacs-rc-flymake.el"))

;; Yasnippet
(load (concat emacs-dir "/rc/emacs-rc-yasnippet.el"))
