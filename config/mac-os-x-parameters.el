;; Emacs configuration


;; Parameters activated only on Mac OS X

(add-to-list 'default-frame-alist '(height . 53))
(add-to-list 'default-frame-alist '(width . 100))

(exec-path-from-shell-initialize)

(setq-default mac-command-modifier 'meta)
(setq-default mac-option-modifier 'control)
(setq-default mac-control-modifier 'super)
(setq-default ns-function-modifier 'hyper)

;; Enable right-click to get spell-checking suggestions
(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

