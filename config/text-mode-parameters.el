;; Emacs configuration

;; Useful parameters to write text.

;; Open new buffers in text-mode.
(setq-default major-mode 'text-mode)

;; Because pandoc reads double spaces as hard line breaks, don't use double
;; spaces as sentence delimiters.
(setq-default sentence-end-double-space nil)

;; Turn on  markdown-mode when opening .md files.
(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'"
  :config
  (unbind-key "M-p" markdown-mode-map)
  (unbind-key "M-n" markdown-mode-map)
  :bind
  (:map markdown-mode-map
        ("C-c l n" . markdown-next-link)
        ("C-c l p" . markdown-previous-link)))

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
  (add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)
  :hook
  (markdown-mode text-mode org-mode))

;; Turn on visual-line-mode (useful to edit line break-sensitive
;; files for which auto-fill-mode should be turned off)
;; (add-hook 'text-mode-hook 'visual-line-mode)

;; Turn on word count mode and display total number of words in modeline.
(use-package wc-goal-mode
  :ensure t
  :custom
  (wc-goal-modeline-format "WC[%tw]")
  :hook
  (markdown-mode text-mode org-mode))

;; Turn on auto-fill-mode and set useful parameters for
;; auto-fill-mode. Use it automatically when working in text-mode
;; buffers.
(use-package auto-fill-mode
  :init
  (setq-default fill-column 80)
  :config
  (add-hook 'fill-nobreak-predicate 'fill-french-nobreak-p)
  (add-hook 'fill-nobreak-predicate 'fill-single-word-nobreak-p)
  (add-hook 'fill-nobreak-predicate 'fill-single-char-nobreak-p)
  :hook
  (markdown-mode text-mode org-mode))

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

