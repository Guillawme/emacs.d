;; Emacs configuration
;; Settings to enforce verification of HTTPS connections.
;; Taken from <https://glyph.twistedmatrix.com/2015/11/editor-malware.html>.

;; Log important messages from HTTPS connections.
(setq-default gnutls-log-level 1)

;; Always check certificates validity.
(setq-default tls-checktrust t)
(setq-default gnutls-verify-error t)

;; Path to a certificate bundle. This file should be maintened up to date.
(setq-default gnutls-trustfiles "/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/certifi/cacert.pem")

(setq-default tls-program
              (format "gnutls-cli --x509cafile %s -p %%p %%h" gnutls-trustfiles))

