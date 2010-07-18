;; -- commons functions

(defun commons/indent-whole-buffer ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

;; -- commons hooks

;; common setting for multiple programming modes
(defun commons/common-hook ()
  (local-set-key "\C-c:" 'uncomment-region)
  (local-set-key "\C-c;" 'comment-region)
  (local-set-key "\C-c\C-c" 'comment-region)
  (show-paren-mode t)
  (setq make-backup-files nil)
  (auto-save-mode nil)
  )

;; show FIXME/TODO/BUG keywords
(defun commons/show-prog-keywords ()
  ;; highlight additional keywords
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil '(("\\<\\(DONE\\):" 1 font-lock-doc-face t))))

;; clean trailing whitespaces automatically
(setq commons/trailing-whitespace-modes '())

(defun commons/trailing-whitespace-hook ()
  (when (member major-mode commons/trailing-whitespace-modes)
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'commons/trailing-whitespace-hook)

;; untabify some modes
(setq commons/untabify-modes '())

(defun commons/untabify-hook ()
  (when (member major-mode commons/untabify-modes)
    (untabify (point-min) (point-max))))
(add-hook 'before-save-hook 'commons/untabify-hook)

(defun commons/common-keys-hook ()
  (local-set-key "\C-F" 'commons/indent-whole-buffer)
  (local-set-key "\C-A" 'mark-whole-buffer)
  )
;; common keys for all files
(add-hook 'find-file-hook 'commons/common-keys-hook)