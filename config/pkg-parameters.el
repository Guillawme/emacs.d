;; Emacs configuration
;; Settings for `package.el' and fetch useful packages

;; Fix the repository list with HTTPS links
(require 'package)
(setq-default package-archives
             '(("gnu" . "https://elpa.gnu.org/packages/")
               ("melpa-stable" . "https://stable.melpa.org/packages/")))

;;(add-to-list 'package-archives
;;	     '("melpa" . "http://melpa.org/packages/") t)
;;(add-to-list 'package-archives
;;             '("gnu-https" . "https://elpa.gnu.org/packages/") t)
;;(add-to-list 'package-archives
;;	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;(add-to-list 'package-archives
;;             '("marmalade" . "https://marmalade-repo.org/packages/") t)
;;(setq package-archives (delq (assoc "gnu" package-archives) package-archives)

(package-initialize)

;; Set a list of packages to be automatically installed if not present.
;; This ensures that all the configuration is movable to a new computer.
(require 'cl)

(defvar my-packages
  '(markdown-mode
    pandoc-mode
    wc-goal-mode
    exec-path-from-shell
    bind-key
    cm-mode)
;;  backup-each-save
  "Packages needed for my configuration, installed automatically if not already present.")

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (my-packages-installed-p)
  ;; Check for new packages or package versions
  (package-refresh-contents)
  ;; Install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

