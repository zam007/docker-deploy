#!/bin/bash

chown -R apacheds:apacheds /var/lib/apacheds/default/partitions
chown -R apacheds:apacheds /var/lib/apacheds/default/log

/opt/$APACHE_DS/bin/apacheds start default

trap "echo 'Stoping ApacheDS...';/opt/$APACHE_DS/bin/apacheds stop default; exit 0" SIGTERM SIGKILL

while true
do
    tail -f /dev/null & wait $!
done
