#!/bin/bash


if [ -f /var/run/httpd/httpd.pid ]; then
    apachectl -k graceful -DFOREGROUND
else
    apachectl -k start -DFOREGROUND
fi
