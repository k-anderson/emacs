(defun flymake-custom-create-temp-file (file-name prefix)
  "Create the file FILE-NAME in a unique directory in the temp directory."
  (file-truename (expand-file-name (file-name-nondirectory file-name)
                                   (expand-file-name  (int-to-string (random)) (flymake-get-temp-dir)))))

(defun flymake-custom-cleanup ()
  "Cleanup after `flymake-java-ecj-init' -- delete temp file and dirs."
  (flymake-safe-delete-file flymake-temp-source-file-name)
  (when flymake-temp-source-file-name
    (flymake-safe-delete-directory (file-name-directory flymake-temp-source-file-name))))


(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       ;;'flymake-create-temp-inplace))
                       'flymake-custom-create-temp-file))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))

    (set 'prj (ede-current-project (file-name-directory
                                    (or (buffer-file-name (current-buffer)) default-directory))))

    (set 'prj-include-local-paths '())
    (set 'prj-include-system-paths '())
    (when prj (not nil)

          (set 'prj-include-local-paths (let ((result))
                                          (dolist (word (oref prj include-path))
                                            (setq result (cons (concat "-I" (concat (ede-project-root-directory prj) word)) result)))
                                          (nreverse result)))

          (set 'prj-include-system-paths (let ((result))
                                           (dolist (word (oref prj system-include-path))
                                             (setq result (cons (concat "-I" word) result)))
                                           (nreverse result)))
          )

    (list "gcc" (append prj-include-local-paths (append prj-include-system-paths (list "-o" "/dev/null" "-Wall" "-S" local-file))))
    ))
(push '(".+\\.c\\(c\\|pp\\)?$" flymake-cc-init flymake-custom-cleanup) flymake-allowed-file-name-masks)
