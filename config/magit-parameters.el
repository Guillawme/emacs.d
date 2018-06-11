;; Emacs configuration

;; Settings for Magit.

(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)
   ("C-x M-g" . magit-dispatch-popup)))

(diminish 'auto-revert-mode "")

;; Disable Emacs' built-in VC mode.
(setq-default vc-handled-backends ())

