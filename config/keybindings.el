;; Emacs configuration

;; Modifier keys on macOS.
(when (memq window-system '(mac ns))
  (setq-default mac-command-modifier 'meta
                mac-option-modifier  'control
                mac-control-modifier 'super
                ns-function-modifier 'hyper))

;; Load greek letters shortcuts.
(load "greek-letters")

;; Load symbols shortcuts.
(load "symbols")

;; Move by paragraph.
(bind-key "M-p" 'backward-paragraph)
(bind-key "M-n" 'forward-paragraph)

;; Bind user-defined commands from ~/.emacs.d/config/my-functions.el to
;; convenient keyboard shortcuts.
(bind-key "C-c i d" 'my-insert-date)
(bind-key "C-c i t" 'my-insert-time)
(bind-key "C-x 2" 'my-split-window-vertically)
(bind-key "C-x 3" 'my-split-window-horizontally)

;; Bind useful commands to convenient keyboard shortcuts.
(bind-key "C-c o" 'bury-buffer)
(bind-key "C-c k" 'kill-this-buffer)

;; Open Emacs config directory. I rarely use this and might need the keybinding
;; for something else...
;(bind-key "C-c c" (lambda () (interactive) (dired "~/.emacs.d/")))

;; Functions to move more quickly.

;; (bind-key "C-S-n"
;;                 (lambda ()
;;                   (interactive)
;;                   (ignore-errors (next-line 5))))

;; (bind-key "C-S-p"
;;                 (lambda ()
;;                   (interactive)
;;                   (ignore-errors (previous-line 5))))

;; (bind-key "C-S-f"
;;                 (lambda ()
;;                   (interactive)
;;                   (ignore-errors (forward-char 5))))

;; (bind-key "C-S-b"
;;                 (lambda ()
;;                   (interactive)
;;                   (ignore-errors (backward-char 5))))

