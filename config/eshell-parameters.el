;; Emacs configuration

;; Parameters for eshell.

;; Make eshell open in a new window instead of replacing the current buffer in
;; the current window.
(setq display-buffer-alist '(("\\`\\*e?shell" display-buffer-pop-up-window)))

;; Set eshell data directory and alias file.
(setq-default eshell-directory-name "~/.emacs.d/eshell")
(setq-default eshell-aliases-file "~/.emacs.d/eshell/aliases")

