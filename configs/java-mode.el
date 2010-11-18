(add-to-list 'load-path (concat emacs-dir "vendor/java/jdee-2.4.0.1/lisp"))
(add-to-list 'load-path (expand-file-name (concat emacs-dir "vendor/elib-1.0")))

;; '(jde-bug-debugger-host-address "127.0.0.1")
;; '(jde-bug-jre-home "/usr/lib/jvm/java-6-sun")
;; '(jde-compile-option-debug (quote ("all" (t nil nil))))
;; (setq jde-debugger (quote ("jdb")))
;; '(jde-global-classpath (quote ("." "/usr/share/java/" "/usr/lib/jvm/java-6-sun/")))
;; '(jde-jdk-doc-url "/usr/share/doc/sun-java6-jdk/html/api/index.html")
(setq jde-jdk-registry (quote (("1.6" . "/usr/lib/jvm/java-6-sun"))))
;; '(jde-regexp-jar-file "/usr/share/java/regexp.jar")
;; '(jde-sourcepath (quote (".")))

(setq defer-loading-jde nil)

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
            (append
             '(("\\.java\\'" . jde-mode))
             auto-mode-alist)))
  (require 'jde))



;; --flymake
(require 'flymake)

(defun flymake-java-ecj-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake/create-temp-file))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    ;; Change your ecj.jar location here    
    (list "java" (list "-jar" (concat emacs-dir "vendor/java/ecj.jar") "-Xemacs" "-d" "/dev/null"
                       "-source" "1.5" "-target" "1.5" "-proceedOnError"
                       "-sourcepath" (car jde-sourcepath) "-classpath"
                       (jde-build-classpath jde-global-classpath) local-file))))

(push '(".+\\.java$" flymake-java-ecj-init flymake/cleanup) flymake-allowed-file-name-masks)
(push '("\\(.*?\\):\\([0-9]+\\): error: \\(.*?\\)\n" 1 2 nil 2 3 (6 compilation-error-face)) compilation-error-regexp-alist)
(push '("\\(.*?\\):\\([0-9]+\\): warning: \\(.*?\\)\n" 1 2 nil 1 3 (6 compilation-warning-face)) compilation-error-regexp-alist)
