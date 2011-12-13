;; android mode from android sdk
(load-file (concat emacs-dir "vendor/android/android.el"))

;; android-mode
(add-to-list 'load-path (concat emacs-dir "vendor/java/android-mode"))
(require 'android-mode)
(setq android-mode-sdk-dir "/opt/android-sdk")