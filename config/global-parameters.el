;; Emacs configuration

;; Various useful global parameters.

;; Always start server mode, to be able to use emacsclient from the command
;; line.
(server-start)

;; Store package configuration and data files cleanly under `~/.emacs.d/etc' and
;; `~/.emacs.d/var'.
(use-package no-littering
  :ensure t
  :init
  (require 'no-littering)
  :config
  ;; Do not list these files in recently opened files.
  (require 'recentf)
  (add-to-list 'recentf-exclude no-littering-var-directory)
  (add-to-list 'recentf-exclude no-littering-etc-directory))

;; Language environment, coding system, input method.
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8-unix)
(setq-default default-input-method 'latin-1-prefix)

;; Modifier keys on macOS.
(when (eq system-type 'darwin)
  (setq-default mac-command-modifier 'meta
                mac-option-modifier  'control
                mac-control-modifier 'super
                ns-function-modifier 'hyper))

;; Do not create a new frame for files opened with the `open' system command.
(setq-default ns-pop-up-frames nil)

;; Interface customizations.
(add-to-list 'default-frame-alist '(height . 53))
(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(setq-default inhibit-startup-screen t
              scroll-preserve-screen-position t
              display-time-24hr-format t
              confirm-nonexistent-file-or-buffer nil)
(column-number-mode 1)
(line-number-mode 1)
(display-time-mode t)
(tool-bar-mode -1)
(menu-bar-mode 1)
(scroll-bar-mode -1)
(tooltip-mode 1)
(blink-cursor-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(pixel-scroll-mode)

;; Allow killing of read-only text, and don't clutter the kill-ring
;; with duplicates.
(setq-default kill-read-only-ok t
              kill-do-not-save-duplicates t)

;; Don't use tabs to indent, but maintain correct appearance (8 spaces).
(setq-default indent-tabs-mode nil
              tab-width 8
              ;; Append a new line at the end of files on save.
              require-final-newline t)

;; Highlight and match parenthesis automatically
(show-paren-mode)
(setq-default show-paren-style 'mixed
              show-paren-when-point-inside-paren t)
(setq-default blink-matching-paren t)
(electric-pair-mode)
(setq-default electric-pair-preserve-balance t
              electric-pair-delete-adjacent-pairs t
              electric-pair-open-newline-between-pairs t
              electric-pair-skip-whitespace t)

;; Always save session (mostly to get all buffers re-opened next time
;; Emacs starts up).
(desktop-save-mode 1)
;; Only restore 5 buffers on startup, the others will be restored
;; lazily when needed or when Emacs is idle.
;; (setq-default desktop-restore-eager 5)

;; Enable change region case commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Move to trash instead of deleting files
(use-package osx-trash
  :if (eq system-type 'darwin)
  :ensure t
  :config
  (osx-trash-setup))
(setq-default delete-by-moving-to-trash t)
;; Alternative way without needing an extra package. The downside is that it
;; does the same as `mv', i.e. the Trash won't offer the "Put back" option.
;; (when (eq system-type 'darwin)
;;   (setq-default trash-directory "~/.Trash"))

;; Always use which-key
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))

;; Keep global eldoc mode enabled, but mask it from the modeline.
(diminish 'eldoc-mode "")

