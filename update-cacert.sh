#! /usr/bin/env bash

# Update the cacert.pem file from curl's official website.
# This will download the file only if the remote file is more recent than the
# local one.

curl \
    --cacert /private/etc/ssl/cert.pem \
    --ssl-reqd \
    --time-cond ~/.emacs.d/cacert.pem \
    https://curl.se/ca/cacert.pem \
    --output ~/.emacs.d/cacert.pem
