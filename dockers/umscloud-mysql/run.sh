#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

chown -R mysql.mysql $VOLUME_HOME
chown -R mysql.mysql /var/log/mysql

sed -i.bak 's|$SERVER_ID|'"$SERVER_ID"'|g' /etc/my.cnf

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    if [ ! -f /usr/share/mysql/my-default.cnf ] ; then
        cp /etc/my.cnf /usr/share/mysql/my-default.cnf
    fi 
    mysql_install_db --user=mysql
    echo "=> Done!"  
    # reset own after mysql_install_db ensure file permission
    chown -R mysql.mysql $VOLUME_HOME
    chown -R mysql.mysql /var/log/mysql
    /create_mysql_admin_user.sh
else
    echo "=> Using an existing volume of MySQL"
fi

exec mysqld_safe
