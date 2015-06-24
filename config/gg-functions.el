;; Emacs configuration


;; Some useful commands to be called by keybindings set in
;; ~/.emacs.d/config/keybindings.el

(defun my-insert-date () "Insert current date at point."
  (interactive)
  (insert (format-time-string "%x")))

(defun my-insert-time () "Insert current time at point."
  (interactive)
  (insert (format-time-string "%X")))


