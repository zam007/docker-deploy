#!/bin/sh
# source ${PWD%/*}/mysql_base_function.sh
source $(cd `dirname $0`; pwd)/mysql_base_function.sh

echo
echo "Create MySQL Servers (master / slave repl)"
echo "============================================="

uname="umscloud_db"
pword="iBcAPT8D7vRnCda"
local_ip="10.0.1.7"

sandbox_mysql_master_ip=`runMysql sandbox_mysql_master 3306 $uname $pword 1`
sandbox_mysql_slave_ip=`runMysql sandbox_mysql_slave 3307 $uname $pword 2`

checkStatus $local_ip 3306 $uname $pword

checkStatus $local_ip 3307 $uname $pword

doReplication $local_ip 3306 $local_ip 3307 $uname $pword $sandbox_mysql_master_ip 3306 $sandbox_mysql_slave_ip 3306

#取消初始化sql
#$(cd `dirname $0`; pwd)/init_sql.sh $local_ip 3306 $uname $pword
