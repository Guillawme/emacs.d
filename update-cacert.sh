#! /usr/bin/env bash

# Update the cacert.pem file from curl's official website.
# This will actually download the file only if the remote file is more recent
# than the local one.

curl \
    --remote-name \
    --time-cond \
    /Users/guillaume/emacs.d/cacert.pem \
    https://curl.haxx.se/ca/cacert.pem

