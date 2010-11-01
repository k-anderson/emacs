;; android mode from android sdk
(load-file "/opt/android-sdk/tools/lib/android.el")

;; android-mode
(add-to-list 'load-path (concat emacs-dir "vendor/java/android-mode"))
(require 'android-mode)
(setq android-mode-sdk-dir "/opt/android-sdk")