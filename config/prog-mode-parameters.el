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

;; Use YAML mode for .yml files
(use-package yaml-mode
  :ensure t
  :mode "\\.yml\\'")

;; Use specific mode for .gitlab-ci.yml files
(use-package gitlab-ci-mode
  :ensure t
  :mode "\\.gitlab-ci.yml\\'")

