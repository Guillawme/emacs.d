;; Emacs configuration


;; Various useful global parameters

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8-unix)
(setq-default default-input-method 'latin-1-prefix)

(column-number-mode 1)
(line-number-mode 1)

(display-time-mode t)
(setq-default display-time-24hr-format t)

(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode 1)
(tooltip-mode 1)
(blink-cursor-mode -1)

(setq-default kill-read-only-ok t)
(setq-default kill-do-not-save-duplicates t)

(fset 'yes-or-no-p 'y-or-n-p)
(setq-default confirm-nonexistent-file-or-buffer nil)

(setq-default indent-tabs-mode nil) ;; don't use tabs to indent
(setq-default tab-width 8) ;; but maintain correct appearance

(setq-default require-final-newline t)

(setq-default blink-matching-paren t)
(show-paren-mode 1)
(electric-pair-mode 0)

(desktop-save-mode 1)

;; Enable change region case commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq-default inhibit-startup-screen t)

;;(setq-default scroll-preserve-screen-position 1)

;; Move to trash instead of deleting files
(setq-default delete-by-moving-to-trash t)


