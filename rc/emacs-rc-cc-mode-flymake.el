(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
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
(push '(".+\\.c\\(c\\|pp\\)?$" flymake-cc-init) flymake-allowed-file-name-masks)
