;;(load-file (concat emacs-dir "vendor/java/jde-eclipse-compiler-server.el"))
;;(require 'jde-eclipse-compiler-server)
;;(add-to-list 'flymake-allowed-file-name-masks '("\\.java\\'" jde-ecj-flymake-init jde-ecj-flymake-cleanup))

(require 'flymake)

(defun flymake-java-ecj-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                       'jde-ecj-create-temp-file))
                       'flymake-custom-create-temp-file))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    ;; Change your ecj.jar location here
    (list "java" (list "-jar" (concat emacs-dir "vendor/java/ecj.jar") "-Xemacs" "-d" "/dev/null"
                       "-source" "1.5" "-target" "1.5" "-proceedOnError"
                       "-sourcepath" (car jde-sourcepath) "-classpath"
                       (jde-build-classpath jde-global-classpath) local-file))))

(push '(".+\\.java$" flymake-java-ecj-init flymake-custom-cleanup) flymake-allowed-file-name-masks)
(push '("\\(.*?\\):\\([0-9]+\\): error: \\(.*?\\)\n" 1 2 nil 2 3 (6 compilation-error-face)) compilation-error-regexp-alist)
(push '("\\(.*?\\):\\([0-9]+\\): warning: \\(.*?\\)\n" 1 2 nil 1 3 (6 compilation-warning-face)) compilation-error-regexp-alist)