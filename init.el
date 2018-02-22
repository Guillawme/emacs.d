;; Emacs configuration

;; Init file in charge of loading everything else.
;; All actual configuration files are stored in "~/.emacs.d/config".
(add-to-list 'load-path "~/.emacs.d/config")

;; This needs to come first, otherwise `package.el' will complain.
(package-initialize)

;; Set user identity (full name and email address), if it is defined.
(when (file-exists-p "~/.emacs.d/config/user-identity.el")
  (load "user-identity"))

;; File to record paremeters set through the `customize' utility.
(setq-default custom-file "~/.emacs.d/config/custom-parameters.el")

;; Load parameter files.
;; Always load `https-parameters' first and `pkg-parameters' second. This is to
;; make sure the rest of the configuration can install packages on demand, and
;; that the package manager will never connect to repositories without using
;; TLS.
(load "https-parameters")
(load "pkg-parameters")
(load "global-parameters")
(load "backup-parameters")
(load "ivy-mode-parameters")
(load "text-mode-parameters")
(load "prog-mode-parameters")
(load "custom-parameters")
(load "my-functions")
(load "eshell-parameters")
(load "keybindings")
(load "org-mode-parameters")

