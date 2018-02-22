;; Emacs configuration

;; Settings to make Emacs correctly find GnuPG. This will work only after
;; `exec-path-from-shell' is loaded (this is done in `pkg-parameters.el').
(setq-default epg-gpg-program "gpg2"
              epg-gpg-home-directory "~/.gnupg/")

;; Settings to enforce verification of HTTPS connections.
;; Taken from <https://glyph.twistedmatrix.com/2015/11/editor-malware.html>.
;; This configuration only works if Emacs was built with GnuTLS
;; embedded. See the end of this file if Emacs uses an external
;; installation of GnuTLS.

;; Set global network security policy, log important messages from
;; GnuTLS, and always check certificates validity.
(setq-default network-security-level 'medium
              gnutls-log-level 2
              gnutls-verify-error t)

;; Path to a certificate bundle. This file should be maintained up to date.
;; To do that, run the following command monthly in ~/emacs.d:
;; curl --remote-name --time-cond cacert.pem https://curl.haxx.se/ca/cacert.pem
;; This will download an up-to-date copy of the Mozilla CA certificate bundle,
;; kindly provided in the correct format (PEM) by the cURL developpers.
(setq-default gnutls-trustfiles (list "/Users/guillaume/emacs.d/cacert.pem"))

;; If GnuTLS is not embedded in Emacs, but accessed from a separate
;; installation, then the following lines are also required.
;; (setq-default tls-checktrust t)
;; (setq-default tls-program
;;               (format "gnutls-cli --x509cafile %s -p %%p %%h"
;;                       gnutls-trustfiles))

