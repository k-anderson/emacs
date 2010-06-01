 ;;;flymake

(require 'flymake)

;;;;;c++

(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)

(add-hook 'c++-mode-hook 'flymake-mode-1)

;;;;;java

(defun flymake-java-init ()
  (list "javac" (list (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-with-folder-structure))))

(push '("\\.java$" flymake-java-init) flymake-allowed-file-name-masks)

(add-hook 'java-mode-hook 'flymake-mode-1)

;;;;;latex
(defun flymake-tex-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-dir   (file-name-directory buffer-file-name))
         (local-file  (file-relative-name
                       temp-file
                       local-dir)))
    (list "platex" (list "-file-line-error" "-interaction=nonstopmode" local-file))))


(defun flymake-tex-cleanup-custom ()
  (let* ((base-file-name (file-name-sans-extension (file-name-nondirectory flymake-temp-source-file-name)))
         (regexp-base-file-name (concat "^" base-file-name "\\.")))
    (mapcar '(lambda (filename)
               (when (string-match regexp-base-file-name filename)
                 (flymake-safe-delete-file filename)))
            (split-string (shell-command-to-string "ls"))))
  (setq flymake-last-change-time nil))

(push '("\\.tex$" flymake-tex-init flymake-tex-cleanup-custom) flymake-allowed-file-name-masks)

(add-hook 'yatex-mode-hook 'flymake-mode-1)


(defun flymake-mode-1 ()
  (if (not (null buffer-file-name)) (flymake-mode))
  (local-set-key "\C-cd" 'flymake-display-err-minibuf))


(defun flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info (flymake-current-line-no))))
         (count (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))