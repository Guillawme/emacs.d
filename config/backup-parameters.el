;; Emacs configuration

;; Backup and autosave parameters.

;; Auto-save after 20 seconds of inactivity, or after 200 characters typed, if
;; the buffer is modified.
(setq-default auto-save-timeout 20
              auto-save-interval 200)

;; Save all backup files in a central directory, to prevent cluttering normal
;; working directories.
(setq-default backup-directory-alist '(("" . "~/.emacs.d/auto-backups/per-save")))

;; Backup parameters.
(setq-default backup-by-copying t
	      delete-old-versions t
	      kept-new-versions 2
	      kept-old-versions 2
	      version-control t
	      vc-make-backup-files t)

(defun force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    ;; Override the default parameters for per-session backups.
    (let ((backup-directory-alist '(("" . "~/.emacs.d/auto-backups/per-session")))
          (kept-new-versions 2))
      (backup-buffer)))
  ;; Make a "per save" backup on each save.  The first save results in
  ;; both a per-session and a per-save backup, to keep the numbering
  ;; of per-save backups consistent.
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook 'force-backup-of-buffer)

