;; Emacs configuration

;; Useful settings for programming modes.

;; Number lines and highlight current line.
(use-package display-line-numbers-mode
  :hook (prog-mode poly-markdown-mode))
(use-package hl-line-mode
  :hook (prog-mode poly-markdown-mode))

;; Make scripts executable on save.
(use-package prog-mode
  :config
  (add-hook 'after-save-hook
            'executable-make-buffer-file-executable-if-script-p))

;; Tab completion.
(setq-default tab-always-indent 'complete)
(use-package company
  :ensure t
  :hook
  (prog-mode . company-mode))

;; Use ESS for R, and polymode for Rmd files.
(use-package ess
  :ensure t
  :mode "\\.R'"
  :config
  (setq-default ess-use-company t
                ess-use-auto-complete nil
                ess-use-ido nil))

(use-package polymode
  :ensure t
  :mode ("\\.Rmd'" . poly-markdown+r-mode))

