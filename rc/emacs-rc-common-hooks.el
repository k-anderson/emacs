;;; emacs-rc-common-hooks.el ---

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

(require 'highlight-parentheses)

;; common settings for different text & programming modes
(defun alexott/common-hook ()
  (local-set-key "\C-c:" 'uncomment-region)
  (local-set-key "\C-c;" 'comment-region)
  (local-set-key "\C-c\C-c" 'comment-region)
  (highlight-parentheses-mode t)
  )

;; show FIXME/TODO/BUG keywords
(defun alexott/show-prog-keywords ()
  ;; highlight additional keywords
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil '(("\\<\\(DONE\\):" 1 font-lock-doc-face t))))

;; clean trailing whitespaces automatically
(setq alexott/trailing-whitespace-modes '(c++-mode c-mode emacs-lisp-mode))

(defun alexott/trailing-whitespace-hook ()
  (when (member major-mode alexott/trailing-whitespace-modes)
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'alexott/trailing-whitespace-hook)

;; untabify some modes
(setq alexott/untabify-modes '(c++-mode c-mode emacs-lisp-mode))
(defun alexott/untabify-hook ()
  (when (member major-mode alexott/untabify-modes)
    (untabify (point-min) (point-max))))
(add-hook 'before-save-hook 'alexott/untabify-hook)

(defun alancastro/common-keys-hook ()
  (local-set-key "\C-F" 'iwb)
  (local-set-key "\C-A" 'mark-whole-buffer)
)
;; common keys for all files
(add-hook 'find-file-hook 'alancastro/common-keys-hook)
