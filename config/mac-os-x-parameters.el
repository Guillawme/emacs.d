;; Emacs configuration


;; Parameters activated only on Mac OS X

(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 100))

(exec-path-from-shell-initialize)

(setq-default mac-command-modifier 'meta)
(setq-default mac-option-modifier 'control)
(setq-default mac-control-modifier 'super)
(setq-default ns-function-modifier 'hyper)


;; Enables convenient shortcuts to type brackets
;; with a French MacBook Pro keyboard

;; Use bind-key utility
(require 'bind-key)

;; (bind-key "C-c n" '(insert-char "007e" 1 t)) ;; tilde
;; (bind-key "C-(" '(insert-char "005b" 1 t)) ;; opening square bracket
;; (bind-key "C-)" '(insert-char "005d" 1 t)) ;; closing square bracket
;; (bind-key "M-(" '(insert-char "007b" 1 t)) ;; opening curly bracket
;; (bind-key "M-)" '(insert-char "007d" 1 t)) ;; closing curly bracket
;; (bind-key "C-:" '(insert-char "005c" 1 t)) ;; backslash
;; (bind-key "C-!" '(insert-char "007c" 1 t)) ;; pipe

(bind-key "C-c n" '(lambda () (interactive) (insert "~"))) ;; tilde
(bind-key "C-(" '(lambda () (interactive) (insert "["))) ;; opening square bracket
(bind-key "C-)" '(lambda () (interactive) (insert "]"))) ;; closing square bracket
(bind-key "C-M-(" '(lambda () (interactive) (insert "{"))) ;; opening curly bracket
(bind-key "C-M-)" '(lambda () (interactive) (insert "}"))) ;; closing curly bracket
(bind-key "C-:" '(lambda () (interactive) (insert "\\"))) ;; backslash
(bind-key "C-!" '(lambda () (interactive) (insert "|"))) ;; pipe


