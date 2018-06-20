;; Emacs configuration

;; Useful parameters to read and write text.

;; Epub reader.
(use-package nov
  :ensure t
  :mode ("\\.epub\\'" . nov-mode))

;; Use Emacs to write in webpage textareas.
;; Browser extension required:
;; https://addons.mozilla.org/en-US/firefox/addon/edit-with-emacs1
;; Use Alt + Enter in a textarea to edit in Emacs, hit C-c C-c when done (with
;; prefix argument C-u to cancel).
(defun my-edit-server-done (prefix)
  "Enhanced `edit-server-done' function. It will also hide Emacs when done."
  (interactive "P")
  (edit-server-done prefix)
  (ns-hide-emacs t))

(use-package edit-server
  :ensure t
  :init
  (edit-server-start)
  (global-edit-server-edit-mode 0)
  :config
  (setq-default edit-server-default-major-mode 'markdown-mode
                edit-server-new-frame nil)
  :bind
  (:map edit-server-edit-mode-map
   ("C-c C-c" . my-edit-server-done)))

;; Open new buffers in markdown-mode.
(setq-default major-mode 'markdown-mode)

;; Because pandoc reads double spaces as hard line breaks, don't use double
;; spaces as sentence delimiters.
(setq-default sentence-end-double-space nil)

;; Turn on  markdown-mode when opening .md files.
(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'")

;; Turn on pandoc-mode when working in text-mode buffers.
(use-package pandoc-mode
  :ensure t
  :config
  ;; Functions to be used by pandoc-mode directives. See
  ;; http://joostkremers.github.io/pandoc-mode/#using--directives
  (defun my-pandoc-current-date (output-format &optional text)
    (format "%s%s" (if text (concat text ", ") "")
            (format-time-string "%d %b %Y")))
  (defun my-pandoc-current-time (output-format)
    (format-time-string "%H:%M"))
  (add-to-list 'pandoc-directives '("date" . my-pandoc-current-date))
  (add-to-list 'pandoc-directives '("time" . my-pandoc-current-time))
  :hook
  (;; Activate pandoc-mode on top of common text modes.
   (markdown-mode text-mode org-mode tex-mode)
   ;; Load settings from `~/.emacs.d/pandoc-mode/default.pandoc'.
   (pandoc-mode . pandoc-load-default-settings)))

;; For LaTeX files, make sure AucTeX is available.
(use-package tex-mode
  :ensure auctex)

;; Turn on visual-line-mode (useful to edit line break-sensitive
;; files for which auto-fill-mode should be turned off)
;; (add-hook 'text-mode-hook 'visual-line-mode)

;; Turn on word count mode and display total number of words in modeline.
(use-package wc-goal-mode
  :ensure t
  :custom
  (wc-goal-modeline-format "WC[%tw]")
  :hook
  (markdown-mode text-mode org-mode tex-mode))

;; Turn on auto-fill-mode and set useful parameters for
;; auto-fill-mode. Use it automatically when working in text-mode
;; buffers.
(use-package auto-fill-mode
  :init
  (setq-default fill-column 80)
  :hook
  ((markdown-mode text-mode org-mode tex-mode)
   (fill-nobreak-predicate . fill-french-nobreak-p)
   (fill-nobreak-predicate . fill-single-word-nobreak-p)
   (fill-nobreak-predicate . fill-single-char-nobreak-p)))

;; Bibliography management.
(use-package ivy-bibtex
  :ensure t
  :bind
  (("C-c r" . ivy-bibtex))
  :config
  (setq-default bibtex-completion-bibliography '("~/Labo/zotero-library.bib")
                bibtex-completion-pdf-field "file"
                bibtex-completion-notes-path "~/Labo/zotero-notes"
                bibtex-completion-notes-extension ".md"
                bibtex-completion-find-additional-pdfs t
                bibtex-completion-format-citation-functions
                '((org-mode      . bibtex-completion-format-citation-org-link-to-PDF)
                  (latex-mode    . bibtex-completion-format-citation-cite)
                  (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
                  (default       . bibtex-completion-format-citation-default))
                ivy-bibtex-default-action 'ivy-bibtex-insert-citation
                ;; Use system default PDF viewer
                bibtex-completion-pdf-open-function
                (lambda (fpath)
                  (call-process "open" nil 0 nil fpath))))

;; Spell-checking parameters.
(setq-default
 ispell-program-name (executable-find "aspell")
 ispell-library-directory "~/Library/Application Support/cocoAspell/aspell6-en-7.1-0/"
 ispell-aspell-dict-dir "~/Library/Application Support/cocoAspell/aspell6-en-7.1-0/"
 ispell-aspell-data-dir "~/Library/Application Support/cocoAspell/aspell6-en-7.1-0/"
 ispell-personal-dictionary nil
 ispell-dictionary "english"
 ispell-extra-args '("--sug-mode=normal" "--lang=en_US"))

(use-package flyspell-correct-ivy
  :ensure t
  :config
  (setq-default flyspell-correct-interface 'flyspell-correct-ivy)
  :bind
  (("C-." . flyspell-correct-word-generic)
   ("C-;" . flyspell-correct-previous-word-generic)
   ("C-'" . flyspell-correct-next-word-generic)
   ;; Enable right-click to get spell-checking suggestions.
   ([down-mouse-3] . flyspell-correct-word)
   ([mouse-3] . undefined)))

