;;(load-file (concat emacs-dir "vendor/git/git.el"))
;;(load-file (concat emacs-dir "vendor/git/git-blame.el"))
;;(require 'git)
;;(require 'git-blame)


;;============================================================
;; git-emacs mode
;;------------------------------------------------------------
(add-to-list 'load-path (concat emacs-dir "vendor/git-emacs"))
;; (eval-when-compile (require 'soo-load))
(setq git-state-modeline-decoration 'git-state-decoration-large-dot)
(require 'git-emacs-autoloads)
;;------------------------------------------------------------
