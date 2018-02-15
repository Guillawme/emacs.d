;; Emacs configuration
;; Settings for Org-Mode

(require 'org)

;; These commands should be available from anywhere, not only Org buffer.
(bind-key "C-c l" 'org-store-link)
(bind-key "C-c a" 'org-agenda)
(bind-key "C-c c" 'org-capture)
(bind-key "C-c b" 'org-iswitchb)

;; Adapt behavior of C-a, C-e and C-k for Org headlines.
(setq-default org-special-ctrl-a/e t)
(setq-default org-special-ctrl-k t)
(setq-default org-ctrl-k-protect-subtree 'ask)

;; Require wrapping braces to interpret _ and ^ as sub/super-script.
(setq org-export-with-sub-superscripts '{}) ; also #+OPTIONS: ^:{}

(setq-default org-cycle-separator-lines 1)

(setq-default org-catch-invisible-edits 'show)
(setq-default org-log-done 'note)

(setq-default org-return-follows-link t)

(setq-default org-list-demote-modify-bullet
              '(("+" . "-")
                ("-" . "+")
                ("*" . "+")))

(setq-default org-list-indent-offset 2)

