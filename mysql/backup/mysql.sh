#!/bin/sh

if [ $# != 1 ] ; then
echo "USAGE: $0 target-sql-name "
exit 1;
fi

mysql -hmysql-$1.cbsazrx5drj0.rds.cn-north-1.amazonaws.com.cn -u umscloud_db -piBcAPT8D7vRnCda
