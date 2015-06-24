;; Emacs configuration


;; Save all backup files in a central directory
(setq-default backup-directory-alist '(("." . "~/.emacs.d/auto-backups")))

;; General parameters 
(setq-default backup-by-copying t
	      delete-old-versions t
	      kept-new-versions 10
	      kept-old-versions 2
	      version-control t
	      vc-make-backup-files t)


;; Use this 'backup-each-save' package (doesn't work at the moment)
;;(require 'backup-each-save)
;;(add-hook 'after-save-hook 'backup-each-save)


;; Default and per-save backups go here:
(setq backup-directory-alist '(("" . "~/.emacs.d/auto-backups/per-save")))

(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.emacs.d/auto-backups/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)


