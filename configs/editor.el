;; -- editor
;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Sets the default font
(set-default-font "Monaco")
(set-face-attribute 'default nil :height 110)

;; copy to clipboard too
(setq x-select-enable-clipboard t)

;; show line numbers
(setq line-number-mode t)

;; show column numbers
(setq column-number-mode t)

;; let's you delete with delete key
(delete-selection-mode t)