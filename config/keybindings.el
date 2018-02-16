;; Emacs configuration

;; Use bind-key utility.
(require 'bind-key)

;; Load greek letters shortcuts.
(load "greek-letters")

;; Load symbols shortcuts.
(load "symbols")

;; Bind user-defined commands from ~/.emacs.d/config/my-functions.el to
;; convenient keyboard shortcuts.
(bind-key "C-c i d" 'my-insert-date)
(bind-key "C-c i t" 'my-insert-time)
(bind-key "C-x 2" 'my-split-window-vertically)
(bind-key "C-x 3" 'my-split-window-horizontally)

;; Bind useful commands to convenient keyboard shortcuts.
(bind-key "C-c o" 'bury-buffer)
(bind-key "C-c k" 'kill-this-buffer)
(bind-key "M-p" 'backward-paragraph)
(bind-key "M-n" 'forward-paragraph)

;; Open Emacs config directory. I rarely use this and might need the keybinding
;; for something else...
;(bind-key "C-c c" (lambda () (interactive) (dired "~/.emacs.d/")))

;; Unset M-p and M-n in markdown-mode, so they call instead backward-paragraph
;; and forward-paragraph as defined above.
;; We first need to load markdown-mode to be able to modify markdown-mode-map.
(require 'markdown-mode)
(unbind-key "M-p" markdown-mode-map)
(unbind-key "M-n" markdown-mode-map)
;; New keybindings for markdown-next-link and markdown-previous-link.
(bind-key "C-c l n" 'markdown-next-link markdown-mode-map)
(bind-key "C-c l p" 'markdown-previous-link markdown-mode-map)

;; Functions to move more quickly.

(bind-key "C-S-n"
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(bind-key "C-S-p"
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(bind-key "C-S-f"
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(bind-key "C-S-b"
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

