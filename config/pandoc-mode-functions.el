;; Emacs configuration

;; Functions to be used by pandoc-mode directives.
;; See http://joostkremers.github.io/pandoc-mode/#using--directives

;; We need pandoc-mode to load before adding functions to pandoc-directives.
(require 'pandoc-mode)

;; Define functions here, don't forget to add them to pandoc-directives list below.
(defun my-pandoc-current-date (output-format &optional text)
  (format "%s%s" (if text (concat text ", ") "")
                 (format-time-string "%d %b %Y")))

(defun my-pandoc-current-time (output-format)
  (format-time-string "%H:%M"))

;; Add functions defined above to pandoc-directives list.
;; This enables pandoc-mode to use those functions with a call to the associated
;; directive in the processed file

(add-to-list 'pandoc-directives '("date" . my-pandoc-current-date))
(add-to-list 'pandoc-directives '("time" . my-pandoc-current-time))

