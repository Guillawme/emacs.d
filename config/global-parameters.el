;; Emacs configuration

;; Various useful global parameters.

;; Language environment, coding system, input method.
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8-unix)
(setq-default default-input-method 'latin-1-prefix)

;; Interface customizations.
(setq-default inhibit-startup-screen t)
(setq-default scroll-preserve-screen-position t)
(column-number-mode 1)
(line-number-mode 1)
(display-time-mode t)
(setq-default display-time-24hr-format t)
(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode -1)
(tooltip-mode 1)
(blink-cursor-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default confirm-nonexistent-file-or-buffer nil)

;; Allow killing of read-only text, and don't clutter the kill-ring
;; with duplicates.
(setq-default kill-read-only-ok t)
(setq-default kill-do-not-save-duplicates t)

;; Don't use tabs to indent, but maintain correct appearance (8 spaces).
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)

;; Append a new line at end of files on save.
(setq-default require-final-newline t)

;; Highlight and match parenthesis automatically
(setq-default blink-matching-paren t)
(show-paren-mode 1)
(setq-default show-paren-style 'mixed)
(setq-default show-paren-when-point-inside-paren t)
(electric-pair-mode nil)
(setq-default electric-pair-preserve-balance t)
(setq-default electric-pair-delete-adjacent-pairs t)
(setq-default electric-pair-open-newline-between-pairs t)
(setq-default electric-pair-skip-whitespace t)

;; Always save session (mostly to get all buffers re-opened next time Emacs
;; starts up).
(desktop-save-mode 1)

;; Enable change region case commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Move to trash instead of deleting files
(setq-default delete-by-moving-to-trash t)

;; Always use which-key
(require 'which-key)
(which-key-mode)
(which-key-setup-side-window-right-bottom)

