;; Emacs configuration
;; Settings for `package.el'.

(require 'package)

;; Fix the repository list with HTTPS links.
(setq-default package-archives
             '(("gnu" . "https://elpa.gnu.org/packages/")
               ("melpa-stable" . "https://stable.melpa.org/packages/")
               ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

;; Check signature when a package provides one, but don't block the installation
;; of unsigned packages.
(setq-default package-check-signature 'allow-unsigned)
;(setq-default package-check-signature 'nil)

;; Set a list of packages to be automatically installed if not present.
;; This ensures that all the configuration is movable to a new computer.
(require 'cl)

(defun my-packages-installed-p ()
  (loop for pkg in package-selected-packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (my-packages-installed-p)
  ;; Check for new packages or package versions.
  (package-refresh-contents)
  ;; Install the missing packages.
  (package-install-selected-packages))

