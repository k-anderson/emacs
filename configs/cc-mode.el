(require 'cc-mode)

(load-file (concat emacs-dir "/vendor/eldoc/eldoc.el"))

;; c include directories
(setq c-eldoc-includes "-I/opt/ri/include -I./ -I../ ")

;; customisation of cc-mode
(defun c-mode/common-hook ()
  ;; style customization
  (setq tab-width 2)
  (setq indent-tabs-mode nil)
  (c-set-style "bsd")
  (setq c-basic-offset 2)

  ;; minor modes
  (c-turn-on-eldoc-mode)

  ;; local keys
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'c-mode-common-hook 'c-mode/common-hook)

;; --commons
(add-hook 'c-mode-common-hook 'commons/common-hook)
(add-hook 'c-mode-common-hook 'commons/show-prog-keywords)

(add-to-list 'commons/trailing-whitespace-modes "c-mode")
(add-to-list 'commons/trailing-whitespace-modes "c++-mode")
(add-to-list 'commons/untabify-modes "c-mode")
(add-to-list 'commons/untabify-modes "c++-mode")

;; --cedet
;; gcc setup
(require 'semantic-gcc)

(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(project unloaded system recursive))

;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)

;;add as many system include as necessary
(semantic-add-system-include "/opt/ri/include" 'c++-mode)
(semantic-add-system-include "/opt/ri/include" 'c-mode)

(setq boost-base-directory "/opt/ri/include")

(add-to-list 'semantic-lex-c-preprocessor-symbol-file
             (concat boost-base-directory "/boost/config.hpp"))

(add-hook 'c-mode-common-hook 'cedet/hook)

(defun c-mode/cedet-hook ()
  ;; (local-set-key "." 'semantic-complete-self-insert)
  ;; (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'c-mode/cedet-hook)

;; --flymake
(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       ;;'flymake-create-temp-inplace))
                       'flymake/create-temp-file))
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
(push '(".+\\.c\\(c\\|pp\\)?$" flymake-cc-init flymake/cleanup) flymake-allowed-file-name-masks)


;; --extra functions
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
    (concat "cd " root-dir "build/; cmake ..; make -j2")))

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

;; --projects definitions
(load-file (concat emacs-dir "custom/c-mode-projects.el"))
