;; Emacs configuration

;; Parameters for Ivy autocompletion and related tools.

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (setq-default ivy-wrap t
                ivy-use-virtual-buffers t
                ivy-count-format "(%d/%d) ")
  :bind
  (("C-c C-r" . ivy-resume)))
(ivy-mode 1)

;; Nicer display for `ivy-switch-buffer'.
(use-package ivy-rich
  :ensure t
  :after (ivy)
  :config
  (setq-default ivy-rich-path-style 'abbrev
                ivy-virtual-abbreviate 'full
                ivy-rich-switch-buffer-align-virtual-buffer t))
(ivy-rich-mode 1)

;; More keybindings for Ivy.
(use-package ivy-hydra
  :ensure t
  :after (ivy hydra))

;; Search with Ivy.
(use-package swiper
  :ensure t
  :bind
  (("C-M-s" . swiper-all)))

;; More Ivy-based commands.
(use-package counsel
  :ensure t
  :diminish
  :config
  (setq-default enable-recursive-minibuffers t)
  :bind
  (("C-s" . counsel-grep-or-swiper)
   ("C-r" . counsel-grep-or-swiper)))
(counsel-mode 1)

;; Facilitated access to SSH hosts listed in `~/.ssh/config'.
(use-package counsel-tramp
  :ensure t
  :config
  (setq-default tramp-default-method "ssh")
  :bind
  (("C-c C-f" . counsel-tramp)
   ("C-c C-q" . counsel-tramp-quit)))

