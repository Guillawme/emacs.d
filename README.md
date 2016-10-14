# Emacs configuration

This configuration was put together mostly by reading Emacs' built-in
documentation plus some online research. It might not be optimal, even if
I tried as much as possible to use only code I understand. It is not completely
portable (especially, the HTTPS configuration relies on an absolute path to find
the certificate bundle).

Feel free to reuse parts or all of it. For it to work properly, you need to add
a file called `~/.emacs.d/config/user-identity.el` with the following content:

```
;; Emacs configuration
;; Definition of user name and email address

;; Don't store this file in version control to avoid publishing it online
;; inadvertently, if you want to keep this information private.

(setq-default user-full-name "Your name or nickname")
(setq-default user-mail-address "you@mailprovider.com")
```

Of course, comments to improve this configuration in any way are really welcome.

