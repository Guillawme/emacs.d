;; Emacs configuration
;; Init file in charge of loading everything else.

;; All actual configuration files are in a `config' subdirectory
(add-to-list 'load-path "~/.emacs.d/config")

;; Set user identity (full name and email address).
(load "user-identity")

;; File to record paremeters set through the `customize' utility.
(setq-default custom-file "~/.emacs.d/config/custom-parameters.el")

;; Load parameter files.
(load "https")
(load "pkg-parameters")
(load "global-parameters")
(load "backup-parameters")
(load "spellchecker-parameters")
(load "text-mode-parameters")
(load "prog-mode-parameters")
(load "custom-parameters")
(load "my-functions")
;(load "pandoc-mode-functions")
;(load "collected-scripts")
(load "eshell-parameters")
(load "keybindings")

;; Load only when running on Mac OS X.
(when (memq window-system '(mac ns))
  (load "mac-os-x-parameters"))

;; Load only when running on Windows.
(when (memq window-system '(w32 pc))
  (load "ms-windows-parameters"))

