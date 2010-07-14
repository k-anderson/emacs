;;; rc/commons/hooks.el ---

;; common settings for different text & programming modes
(defun alancastro/common-hook ()
  (local-set-key "\C-c:" 'uncomment-region)
  (local-set-key "\C-c;" 'comment-region)
  (local-set-key "\C-c\C-c" 'comment-region)
  (show-paren-mode t)
  (setq make-backup-files nil)
  (auto-save-mode nil)
  )

;; show FIXME/TODO/BUG keywords
(defun alancastro/show-prog-keywords ()
  ;; highlight additional keywords
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil '(("\\<\\(DONE\\):" 1 font-lock-doc-face t))))

;; clean trailing whitespaces automatically
(setq alancastro/trailing-whitespace-modes '())

(defun alancastro/trailing-whitespace-hook ()
  (when (member major-mode alancastro/trailing-whitespace-modes)
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'alancastro/trailing-whitespace-hook)

;; untabify some modes
(setq alancastro/untabify-modes '())

(defun alancastro/untabify-hook ()
  (when (member major-mode alancastro/untabify-modes)
    (untabify (point-min) (point-max))))
(add-hook 'before-save-hook 'alancastro/untabify-hook)

(defun alancastro/common-keys-hook ()
  (local-set-key "\C-F" 'indent-whole-buffer)
  (local-set-key "\C-A" 'mark-whole-buffer)
  )
;; common keys for all files
(add-hook 'find-file-hook 'alancastro/common-keys-hook)