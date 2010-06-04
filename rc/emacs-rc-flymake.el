;;flymake
(require 'flymake)

(setq temporary-file-directory "/tmp")

;; todo - simply clear all default rules?
(setq flymake-allowed-file-name-masks (delete '("\\.c\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.cpp\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.cs\\'" flymake-simple-make-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.xml\\'" flymake-xml-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.tex\\'" flymake-simple-tex-init) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup) flymake-allowed-file-name-masks))
(setq flymake-allowed-file-name-masks (delete '("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup) flymake-allowed-file-name-masks))

;;no more problems with read-only files.
(add-hook 'find-file-hook 'flymake-find-file-hook)

;;shows flymake erros on minibuffer
(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))
(add-hook 'post-command-hook 'my-flymake-show-help)

