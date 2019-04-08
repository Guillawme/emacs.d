;; Emacs configuration

;; Init file in charge of loading everything else.
;; All actual configuration files are stored in "~/.emacs.d/config".
(defvar user-emacs-config-dir (concat user-emacs-directory "config")
  "Path under `user-emacs-directory' where to store user's configuration files.")
(add-to-list 'load-path user-emacs-config-dir)

;; This needs to come first, otherwise `package.el' will complain.
(package-initialize)

;; Set user identity (full name and email address), if it is defined.
(when (file-exists-p (concat user-emacs-config-dir "/user-identity.el"))
  (load "user-identity"))

;; File to record paremeters set through the `customize' utility.
(setq-default custom-file (concat user-emacs-config-dir "/custom-parameters.el"))

;; Load parameter files.
;; Always load `https-parameters' first, `gpg-parameters' second and
;; `pkg-parameters' third. This is to make sure the rest of the configuration
;; can install packages on demand, that the package manager will never connect
;; to repositories without using TLS, and that it will be able to check
;; signatures when they are available.
(load "https-parameters")
(load "pkg-parameters")
(load "gpg-parameters")
(load "global-parameters")
(load "backup-parameters")
(load "ivy-mode-parameters")
(load "text-mode-parameters")
(load "prog-mode-parameters")
(load "magit-parameters")
(load "custom-parameters")
(load "my-functions")
(load "eshell-parameters")
(load "keybindings")
(load "org-mode-parameters")
(load "evil-mode-parameters")

