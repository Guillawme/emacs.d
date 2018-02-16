;; Emacs configuration

;; Init file in charge of loading everything else.
;; All actual configuration files are stored in "~/.emacs.d/config".
(add-to-list 'load-path "~/.emacs.d/config")

;; Added by Package.el. This must come before configurations of installed
;; packages. Don't delete this line. If you don't want it, just comment it out
;; by adding a semicolon to the start of the line. You may delete these
;; explanatory comments.
(package-initialize)

;; Set user identity (full name and email address).
(load "user-identity")

;; File to record paremeters set through the `customize' utility.
(setq-default custom-file "~/.emacs.d/config/custom-parameters.el")

(require 'url-handlers)

;; Load parameter files.
(load "https-parameters")
(load "pkg-parameters")
(load "global-parameters")
(load "backup-parameters")
(load "spellchecker-parameters")
(load "text-mode-parameters")
(load "prog-mode-parameters")
(load "custom-parameters")
(load "my-functions")
(load "pandoc-mode-functions")
(load "eshell-parameters")
(load "keybindings")
(load "org-mode-parameters")

;; Load only when running on Mac OS X.
(when (memq window-system '(mac ns))
  (load "mac-os-x-parameters"))

;; Load only when running on Windows.
(when (memq window-system '(w32 pc))
  (load "ms-windows-parameters"))

