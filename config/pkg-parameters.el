;; Emacs configuration


;; Add MELPA repository to the repo list

(require 'package)
;;(add-to-list 'package-archives
;;	     '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
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


