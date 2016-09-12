;; Emacs configuration
;; Settings to enforce verification of HTTPS connections
;; Taken from <https://glyph.twistedmatrix.com/2015/11/editor-malware.html>

(setq-default tls-checktrust t)

(let ((trustfile
       ;; (replace-regexp-in-string
       ;;  "\\\\" "/"
       ;;  (replace-regexp-in-string
       ;;   "\n" ""
       ;;   (shell-command-to-string "python3 -m certifi")))
       "/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/certifi/cacert.pem"))
  (setq tls-program
        (list
         (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
                 (if (eq window-system 'w32) ".exe" "") trustfile)))
  (setq gnutls-verify-error t)
  (setq gnutls-trustfiles (list trustfile)))

