;; Emacs configuration

;; Some useful commands to be called by keybindings set in
;; ~/.emacs.d/config/keybindings.el

(defun my-reload-config ()
  "Reload `user-init-file'."
  (interactive)
  (load user-init-file))

(defun my-insert-date ()
  "Insert current date at point."
  (interactive)
  (insert (format-time-string "%x")))

(defun my-insert-time ()
  "Insert current time at point."
  (interactive)
  (insert (format-time-string "%X")))

(defun my-split-window-vertically ()
  "Split window vertically, display next buffer and move point to new window."
  (interactive)
  (split-window-vertically)
  (set-window-buffer (next-window) (other-buffer))
  (other-window 1))

(defun my-split-window-horizontally ()
  "Split window horizontally, display next buffer and move point to new window."
  (interactive)
  (split-window-horizontally)
  (set-window-buffer (next-window) (other-buffer))
  (other-window 1))

(defun my-flyspell-buffer ()
  "Spellcheck current buffer after checking whether flyspell-mode is on."
  (interactive)
  (if (featurep 'flyspell)
      (nil)
    (flyspell-mode))
  (flyspell-buffer))

