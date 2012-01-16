;; Remove Annoyances
(setq inhibit-startup-message t)  ;; inhibit startup messages
(setq require-final-newline t)    ;; make the last line end in a carriage return
(fset 'yes-or-no-p 'y-or-n-p)     ;; allow just "y" instead of "yes" on exit
(setq next-line-add-newlines nil) ;; disallow creation of new lines on  "arrow-down key" at end of the buffer
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)

(require 'vc-git)

;; General Embellishments
(menu-bar-mode -1)
(setq font-lock-maximum-decoration t)
(global-set-key "\M-g" 'goto-line)
;;(highlight-tabs)
;;(highlight-trailing-whitespace)
;!!!(windmove-default-keybindings 'meta)
(line-number-mode 1)
;!! (cua-mode t)

;; Show paren
(require 'paren)
(show-paren-mode t)
                                                                                                                                                                                                                                                                          
;; Take care of tabs                                                                                                                                                                                                                                                      
(setq c-basic-indent 2)                                                                                                                                                                                                                                                   
(setq tab-width 4)                                                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                          
;; no tabs by default. modes that really need tabs should enable                                                                                                                                                                                                          
;; indent-tabs-mode explicitly. makefile-mode already does that, for                                                                                                                                                                                                      
;; example.                                                                                                                                                                                                                                                               
(setq-default indent-tabs-mode nil)                                                                                                                                                                                                                                       
;; if indent-tabs-mode is off, untabify before saving                                                                                                                                                                                                                     
(add-hook 'write-file-hooks                                                                                                                                                                                                                                               
         (lambda () (if (not indent-tabs-mode)                                                                                                                                                                                                                            
                        (untabify (point-min) (point-max)))))                                                                                                                                                                                                             
                                                                                                                                                                                                                                                                          
;; C-mode Embellishments                                                                                                                                                                                                                                                  
(setq kill-whole-line t)      ;; Make ctrl-k kill an entire line if cursor at the beginning                                                                                                                                                                               
(setq c-hungry-delete-key t)  ;;will delete "hungrily" in C mode                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                          
;; Moving cursor down at bottom scrolls only a single line, not half page                                                                                                                                                                                                 
(setq scroll-step 1)                                                                                                                                                                                                                                                      
(setq scroll-conservatively 5)                                                                                                                                                                                                                                            
(global-set-key [delete] 'delete-char)                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                          
;; Backup files and auto-saves                                                                                                                                                                                                                                            
;; (setq make-backup-files nil)                                                                                                                                                                                                                                           
(setq auto-save-default nil)                                                                                                                                                                                                                                              
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/emacs-backup"))))                                                                                                                                                                                                
(setq backup-by-copying t)                                                                                                                                                                                                                                                
(setq delete-old-versions t                                                                                                                                                                                                                                               
  kept-new-versions 6                                                                                                                                                                                                                                                     
  kept-old-versions 2                                                                                                                                                                                                                                                     
  version-control t)                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                          
(define-key input-decode-map "\e\M-[D" [(meta left)])
(define-key input-decode-map "\e\M-[C" [(meta right)])

(define-key global-map "\C-h" 'backward-delete-char)
(define-key global-map "\C-x?" 'help-command)
(define-key global-map [f1]   'revert-buffer)
(define-key global-map [f2]   'replace-string)
(define-key global-map [f3]   'undo)
(define-key global-map [f4]   'kill-buffer)
(define-key global-map [f5]   'goto-line)
(define-key global-map [f8]   'kill-line)
(define-key global-map [f9]   'iconify-frame)
(define-key global-map [f11]  'auto-save-mode)

(define-key global-map [M-home] 'beginning-of-buffer)
(define-key global-map [C-home] 'beginning-of-buffer)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [M-end] 'end-of-buffer)
(define-key global-map [C-end] 'end-of-buffer)
(define-key global-map [end] 'end-of-line)

(define-key global-map [C-down]  'scroll-up)
(define-key global-map [C-up]    'scroll-down)
(define-key global-map [C-left]  'beginning-of-line)
(define-key global-map [C-right] 'end-of-line)
