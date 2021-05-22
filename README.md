# Emacs configuration

**This is not maintained anymore ([I now use doom][doom]).**

This configuration was put together mostly by reading Emacs' built-in
documentation plus some online research; I tried as much as possible to use only
code I understand. It might not be optimal, and it is not completely portable
(especially, the HTTPS configuration relies on an absolute path to find the
certificate bundle).

Feel free to reuse parts or all of it. You can add a file called
`~/.emacs.d/config/user-identity.el` with the following content:

```
;; Emacs configuration
;; Definition of user name and email address

;; If you want to keep this information private, don't store this file in
;; version control to avoid publishing it online inadvertently.

(setq-default user-full-name "Your name or nickname")
(setq-default user-mail-address "you@mailprovider.com")
```

Comments to improve this configuration in any way are really welcome.

[doom]: https://github.com/Guillawme/doom.d

