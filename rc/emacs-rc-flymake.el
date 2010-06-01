;;flymake
(require 'flymake)

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


;;;;;c++

(setq include_flags (list "-I." "-I/opt/ri/include"))

(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "gcc" (list "-o" "/dev/null" "-I." "-I/opt/ri/include" "-Wall" "-S" local-file))
    ))
(push '(".+\\.c\\(c\\|pp\\)?$" flymake-cc-init) flymake-allowed-file-name-masks)

;; flymake for c/c++
;; to make flymake work, a Makefile must be created on the top of the project containing the following lines:
;; check-syntax:
;;   $(CC) -o /dev/null -Wall -S ${CHK_SOURCES}
;; if you have include directories outside the default ones, you can add for example: -I/opt/include to it.
;; (setq flymake-allowed-file-name-masks
;;       (cons '(".+\\.c\\(c\\|pp\\)?$"
;;               flymake-simple-make-init
;;               flymake-simple-cleanup
;;               flymake-get-real-file-name)
;;             flymake-allowed-file-name-masks))
;; (defun my-flymake-cpp-mode-hook ()
;;   (flymake-mode 1))
;; (add-hook 'c-mode-common-hook 'my-flymake-cpp-mode-hook)


