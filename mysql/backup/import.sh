#!/bin/sh

if [ $# != 2 ] ; then
echo "USAGE_IMPORTSQL: $0 target-sql-name database_file"
exit 1;
fi

echo start import... $1 $2

mysql -hmysql-$1.cbsazrx5drj0.rds.cn-north-1.amazonaws.com.cn -u umscloud_db -piBcAPT8D7vRnCda<sql/$2.sql

echo end import file: $2


