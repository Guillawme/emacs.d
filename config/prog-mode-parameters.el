;; Emacs configuration

;; Useful settings for programming modes.

;; Number lines and highlight current line.
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)

;; Make scripts executable on save.
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

