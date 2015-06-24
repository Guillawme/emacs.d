;; Emacs configuration


;; Use scripts not found in repositories
(add-to-list 'load-path "~/.emacs.d/collected-scripts")


;; This "journal-mode" script makes it easy to
;; maintain a collection of timestamped files
(load "journal-mode")
(setq-default journal-dir "~/journal/")


