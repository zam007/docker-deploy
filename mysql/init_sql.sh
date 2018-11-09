#!/bin/sh
base_Path=$(cd `dirname $0`; pwd)
for sql in $base_Path/sql/com/umscloud/server/sql/*;do
    echo "****** import sql : $sql ******"
    echo $(mysql -h$1 -P$2 -u$3 -p$4 < $sql)
done

echo "**done**"
