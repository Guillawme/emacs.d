;; Emacs configuration

;; Settings for org-mode.
(use-package org
  :ensure org-plus-contrib
  :pin org
  :mode (("\\.org\\'" . org-mode))
  :bind
  ;; These commands should be available from anywhere, not only in org
  ;; buffers.
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c b" . org-iswitchb))
  :config
  ;; Adapt behavior of C-a, C-e and C-k for Org headlines.
  (setq-default org-special-ctrl-a/e t
                org-special-ctrl-k t
                org-ctrl-k-protect-subtree 'ask
                ;; Require wrapping braces to interpret _ and ^ as
                ;; sub/super-script. Also #+OPTIONS: ^:{}
                org-export-with-sub-superscripts '{}
                ;; Various parameters.
                org-cycle-separator-lines 1
                org-catch-invisible-edits 'show
                org-log-done 'note
                org-return-follows-link t
                org-list-demote-modify-bullet '(("+" . "-")
                                                ("-" . "+")
                                                ("*" . "+"))
                org-list-indent-offset 2))

