#!/bin/sh
# source ${PWD%/*}/mysql_base_function.sh
source $(cd `dirname $0`; pwd)/mysql_base_function.sh

echo
echo "Create MySQL Servers (master / slave repl)"
echo "============================================="

uname="umscloud_db"
pword="iBcAPT8D7vRnCda"
local_ip="10.0.1.7"

test_mysql_master_ip=`runMysql test_mysql_master 3308 $uname $pword 1`
#test_mysql_slave_ip=`runMysql test_mysql_slave 3307 $uname $pword 2`

echo "test_mysql_master_ip:$test_mysql_master_ip"
#echo "test_mysql_slave_ip:$test_mysql_slave_ip"
checkStatus $local_ip 3308 $uname $pword

#checkStatus $local_ip 3307 $uname $pword

#doReplication $local_ip 3308 $local_ip 3307 $uname $pword $test_mysql_master_ip 3306 $test_mysql_slave_ip 3306

$(cd `dirname $0`; pwd)/init_sql.sh $local_ip 3308 $uname $pword
