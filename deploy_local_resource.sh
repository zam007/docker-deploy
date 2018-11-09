#!/bin/sh

source $(cd `dirname $0`; pwd)/mysql/mysql_base_function.sh
source $(cd `dirname $0`; pwd)/redis/redis_base_function.sh

uname="umscloud"
pword="umscloud"

boot2docker_status=`boot2docker status`
if [ ${boot2docker_status} != "running" ]
    then
        echo ==== boot2docker is not running ====
        exit
fi

local_ip=`boot2docker ip 2>/dev/null`

echo "local_ip is $local_ip"

echo :::mysql:`runMysql local_mysql 3306 ${uname} ${pword} 1`

checkStatus ${local_ip} 3306 ${uname} ${pword}

$(cd `dirname $0`; pwd)/mysql/init_sql.sh ${local_ip} 3306 ${uname} ${pword}

echo :::redis:[`runRedis local_redis_master_0 6379`]

sleep 3

echo "check redis: " `(echo -en "info\r\n"; sleep 1) | nc ${local_ip} 6379 | grep role`