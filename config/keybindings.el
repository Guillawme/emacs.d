;; Emacs configuration

;; Load greek letters shortcuts.
(load "greek-letters")

;; Load symbols shortcuts.
(load "symbols")

;; Move by paragraph.
(bind-keys*
 ("M-[" . backward-paragraph)
 ("M-]" . forward-paragraph))

;; Bind user-defined commands from ~/.emacs.d/config/my-functions.el to
;; convenient keyboard shortcuts.
(bind-keys* :prefix-map my-insert-functions
            :prefix-docstring "Functions to automatically insert
            current date and time at point."
            :prefix "C-c i"
            ("d" . my-insert-date)
            ("t" . my-insert-time))
(bind-keys* :prefix-map my-split-window-functions
            :prefix-docstring "Smarter window-splitting functions."
            :prefix "C-x"
            ("2" . my-split-window-vertically)
            ("3" . my-split-window-horizontally))

;; Bind useful commands to convenient keyboard shortcuts.
(bind-keys* :prefix-map buffer-commands
            :prefix-docstring "Useful buffer commands reachable
            from easy-to-remember keybindings."
            :prefix "C-c"
            ("o" . bury-buffer)
            ("k" . kill-this-buffer))

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

