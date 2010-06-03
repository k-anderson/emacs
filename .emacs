;;; I want to enter the debugger on any error and see a
;;; backtrace. This is first in the file so I get a hint where any
;;; errors later on are.
(setq debug-on-error t)

;; Sets emacs-dir to the current directory where .emacs is placed in.
(setq emacs-dir (file-name-directory (file-truename (or load-file-name buffer-file-name))))

;; Load rc files

;; --[Load all vendors]----------------------------------------------------------------------------------------
(load (concat emacs-dir "rc/emacs-rc-load-vendors.el"))

;; --[Load emacs X confs]----------------------------------------------------------------------------------------
(load (concat emacs-dir "rc/emacs-rc-editor.el"))

;; --[Load desktop autosave]----------------------------------------------------------------------------------------
(load (concat emacs-dir "rc/emacs-rc-autosave.el"))

;; --[Load theme confs]----------------------------------------------------------------------------------------
;; Load current theme (irblack)
(load (concat emacs-dir "rc/emacs-rc-theme-irblack.el"))

;; --[Vendor specific confs]----------------------------------------------------------------------------------------

;; Interactively Do Things
(load (concat emacs-dir "rc/emacs-rc-ido.el"))

;; Cedet conf
(load (concat emacs-dir "rc/emacs-rc-cedet.el"))

;; Yasnippet
(load (concat emacs-dir "rc/emacs-rc-yasnippet.el"))

;; --[Load common functions and hooks]----------------------------------------------------------------------------------------
;; Common functions
(load (concat emacs-dir "rc/emacs-rc-common-functions.el"))
;; Common hooks
(load (concat emacs-dir "rc/emacs-rc-common-hooks.el"))

;; --[Flymake conf]----------------------------------------------------------------------------------------
(load (concat emacs-dir "rc/emacs-rc-flymake.el"))

;; --[Load editing mode confs]----------------------------------------------------------------------------------------
;; CCMode customization
(load (concat emacs-dir "rc/emacs-rc-cc-mode-defs.el"))
(load (concat emacs-dir "rc/emacs-rc-cc-mode.el"))
(load (concat emacs-dir "rc/emacs-rc-cc-mode-flymake.el"))
;; Emacs lisp mode customization
(load (concat emacs-dir "rc/emacs-rc-elisp-mode.el"))
;; Textile mode
(load (concat emacs-dir "rc/emacs-rc-textile-mode.el"))

;; --[Custom preferences]----------------------------------------------------------------------------------------

;; Load cc-mode customizations
(when (file-exists-p (concat emacs-dir "rc/emacs-rc-cc-mode-custom.el"))
  (load (concat emacs-dir "rc/emacs-rc-cc-mode-custom.el"))
)
