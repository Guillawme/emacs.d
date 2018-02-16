;; Emacs configuration

;; Settings to enforce verification of HTTPS connections.
;; Taken from <https://glyph.twistedmatrix.com/2015/11/editor-malware.html>.

;; Set global network security policy.
(setq-default network-security-level 'medium)

;; Log important messages from HTTPS connections.
(setq-default gnutls-log-level 2)

;; The following works only if Emacs was built with GnuTLS embedded. See the end
;; of this file if Emacs uses an external installation of GnuTLS.

;; Always check certificates validity.
(setq-default gnutls-verify-error t)

;; Path to a certificate bundle. This file should be maintained up to date.
;; To do that, run the following command monthly in ~/emacs.d:
;; curl --remote-name --time-cond cacert.pem https://curl.haxx.se/ca/cacert.pem
;; This will download an up-to-date copy of the Mozilla CA certificate bundle,
;; kindly provided in the correct format (PEM) by the cURL developpers.
(setq-default gnutls-trustfiles (list "/Users/guillaume/emacs.d/cacert.pem"))

;; If GnuTLS is not embedded in Emacs, but accessed from a separate
;; installation, then these two lines are required.
;(setq-default tls-checktrust t)
;(setq-default tls-program
;              (format "gnutls-cli --x509cafile %s -p %%p %%h" gnutls-trustfiles))

