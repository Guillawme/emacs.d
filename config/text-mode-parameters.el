;; Emacs configuration

;; Useful parameters to write text.

;; Open new buffers in text-mode.
(setq-default major-mode 'text-mode)

;; Turn on  markdown-mode and pandoc-mode when opening .md files.
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'pandoc-mode)

;; Turn on visual-line-mode (useful to edit line break-sensitive
;; files for which auto-fill-mode should be turned off)
;(add-hook 'text-mode-hook 'visual-line-mode)

;; Turn on word count mode and display total number of words in modeline.
(require 'wc-goal-mode)
;(wc-goal-modeline-format "WC[%tw]") ;; this line is in custom-parameters.el, causes bug here
(add-hook 'text-mode-hook 'wc-goal-mode)

;; Turn on live spell-checking.
;(add-hook 'text-mode-hook 'flyspell-mode)

;; Turn on auto-fill-mode and set useful parameters for auto-fill-mode.
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 80)
(add-hook 'fill-nobreak-predicate 'fill-french-nobreak-p)
(add-hook 'fill-nobreak-predicate 'fill-single-word-nobreak-p)
(add-hook 'fill-nobreak-predicate 'fill-single-char-nobreak-p)

;; Because pandoc reads double spaces as hard line breaks, don't use double
;; spaces as sentence delimiters.
(setq-default sentence-end-double-space nil)

