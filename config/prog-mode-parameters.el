;; Emacs configuration

;; Useful settings for programming modes.

;; Number lines and highlight current line.
(use-package linum-mode
  :hook prog-mode)
(use-package hl-line-mode
  :hook prog-mode)

;; Make scripts executable on save.
(use-package prog-mode
  :config
  (add-hook 'after-save-hook
            'executable-make-buffer-file-executable-if-script-p))

