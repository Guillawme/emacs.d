;; Emacs configuration

;; Parameters for eshell.

;; Make eshell open in a new window instead of replacing the current buffer in
;; the current window.
(setq-default display-buffer-alist '(("\\`\\*e?shell" display-buffer-pop-up-window)))

;; Set eshell alias file (its data directory follows the no-littering
;; convention, stored in ~/.emacs.d/var).
(setq-default eshell-aliases-file (concat eshell-directory-name "aliases"))

