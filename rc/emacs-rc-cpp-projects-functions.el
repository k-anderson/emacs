;; ede customization
(require 'semantic-lex-spp)
(global-ede-mode t) ; enable ede mode

;; my functions for EDE
(defun alexott/ede-get-local-var (fname var)
  "fetch given variable var from :local-variables of project of file fname"
  (let* ((current-dir (file-name-directory fname))
         (prj (ede-current-project current-dir)))
    (when prj
      (let* ((ov (oref prj local-variables))
             (lst (assoc var ov)))
        (when lst
          (cdr lst))))))

;; setup compile package
;; TODO: allow to specify function as compile-command
(require 'compile)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(setq mode-compile-always-save-buffer-p t)

(defun alexott/compile ()
  "Saves all unsaved buffers, and runs 'compile'."
  (interactive)
  (save-some-buffers t)
  (let* ((r (alexott/ede-get-local-var
             (or (buffer-file-name (current-buffer)) default-directory)
             'compile-command))
         (cmd (if (functionp r) (funcall r) r)))
    ;;    (message "AA: %s" cmd)
    (set (make-local-variable 'compile-command) (or cmd compile-command))
    (compile compile-command)))

(global-set-key [f9] 'alexott/compile)

;;
(defun alexott/gen-std-compile-string ()
  "Generates compile string for compiling CMake project in debug mode"
  (let* ((current-dir (file-name-directory
                       (or (buffer-file-name (current-buffer)) default-directory)))
         (prj (ede-current-project current-dir))
         (root-dir (ede-project-root-directory prj))
         )
    (concat "cd " root-dir "; make -j2")))

;;
(defun alexott/gen-cmake-debug-compile-string ()
  "Generates compile string for compiling CMake project in debug mode"
  (let* ((current-dir (file-name-directory
                       (or (buffer-file-name (current-buffer)) default-directory)))
         (prj (ede-current-project current-dir))
         (root-dir (ede-project-root-directory prj))
         (subdir "")
         )
    (when (string-match root-dir current-dir)
      (setf subdir (substring current-dir (match-end 0))))
    (concat "cd " root-dir "build/" "; cmake ..; make -j2")))
;;    (concat "cd " root-dir "Debug/" subdir "; make -j3")))

