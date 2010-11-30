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
		  "textile-mode"
		  "elisp-mode"
		  "python-mode"
		  "cc-mode"
		  "erlang-mode"
		  "php-mode"
                  "java-mode"
		  "javascript-mode"
		  "css-mode"
		  "android-mode"
		))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(jde-run-option-debug nil)
 '(py-indent-offset 4))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
