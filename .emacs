;;; I want to enter the debugger on any error and see a
;;; backtrace. This is first in the file so I get a hint where any
;;; errors later on are.
(setq debug-on-error t)

;; Sets emacs-dir to the current directory where .emacs is placed in.
(setq emacs-dir (file-name-directory (file-truename (or load-file-name buffer-file-name))))
(setq emacs-config-dir (concat emacs-dir "configs/"))

(defun load-cfg-files (filelist)
  (dolist (file filelist)
    (load (expand-file-name
           (concat emacs-config-dir file)))
    (message "Loaded config file: %s" file)
    ))

(load-cfg-files '("commons"
		  "ido"
		  "theme"		  
                  "editor"
		  "yasnippet"
		  "flymake"
		  "cedet"
		  "auto-complete"
		  "org-mode"
		  "textile-mode"
		  "elisp-mode"
		  "python-mode"
		  "cc-mode"
		  "erlang-mode"
		  "php-mode"
                  "java-mode"))