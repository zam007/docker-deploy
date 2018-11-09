#!/bin/sh

if [ $# != 2 ] ; then
echo "USAGE_BACKUPSQL: $0 original-sql-name database"
exit 1;
fi

echo start backup... $1 $2

mysqldump --host=mysql-$1.cbsazrx5drj0.rds.cn-north-1.amazonaws.com.cn -u umscloud_db -piBcAPT8D7vRnCda --database $2 --single-transaction --compress --order-by-primary>sql/$2.sql

echo backup file: sql/$2.sql
