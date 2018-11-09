#!/usr/bin/env bash
#for single
if [ $# != 1 ] ; then
echo "USAGE: $0 test.sql"
exit 1;
fi

mysql -h10.0.1.7  -u umscloud_db -piBcAPT8D7vRnCda<sql/com/umscloud/server/sql/$1