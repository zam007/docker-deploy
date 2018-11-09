#!/bin/bash

DOCKER_IP=$(ifconfig docker0 | grep 'inet ' | awk '{ print $2}' | cut -d: -f2)

echo "docker_gateway_ip : $DOCKER_IP"

docker pull harbor.tiejin.cn/closer/umscloud-redis-new
#docker pull harbor.tiejin.cn/closer/umscloud-redis-sentinel

######
#
# run redis master
#
# runRedis [1]dockerName [2]dockerPort
#
####
runRedis(){
    exec 3>&1 >&2
    echo "stop: "`docker stop $1`
    sleep 3
    echo "rm: "`docker rm $1`
#    rm -rf /data/$1/:/data/
#    rm -rf /logs/$1/
    echo "run [$1]: "`docker run -p $2:6379 --name $1 -t -d -i -v /data/$1/:/data/ -v /logs/$1/:/logs/ harbor.tiejin.cn/closer/umscloud-redis-new`
    exec >&3-
    echo $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1)
}

#####
#
# salveof
# 1:master_ip
# 2:master_port
# 3:slave_ip
# 4:slave_port
# 5:master_link_ip
# 6:master_link_port
#
#####
slaveof(){
    echo "[$3:$4] be slave of [$1:$2]"
    (echo -en "slaveof $5 $6\r\n"; sleep 1) | nc $3 $4
    echo "check master [$1:$2]: " `(echo -en "info\r\n"; sleep 1) | nc $1 $2 | grep role`
    echo "check slave  [$3:$4]: " `(echo -en "info\r\n"; sleep 1) | nc $3 $4 | grep role`
}

#####
#
# runSentinel
# 1:dockerName
# 2:dockerPort
#
#####
runSentinel(){
    exec 3>&1 >&2
    echo "run sentinel [$1] with port [$2]"
    echo "stop: " `docker stop $1`
    sleep 3
    echo "rm: "`docker rm $1`
    rm -rf /data/$1/
    rm -rf /logs/$1/
    echo "run [$1]: "`docker run --name $1 -d -p $2:26379 -v /data/$1/:/data/ -v /logs/$1/:/logs/ harbor.tiejin.cn/closer/umscloud-redis-sentinel --sentinel announce-ip $DOCKER_IP --sentinel announce-port $2`
    exec >&3-
    echo $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1)
}

#####
#
# sentinelMonitor
# 1:sentinel_ip
# 2:sentinel_port
# 3:monitor_redis_ip
# 4:monitor_redis_port
# 5:monitor_name
#
#####
sentinelMonitor(){
    echo "[$1:$2] monitor $3 $4"
    (echo -en "sentinel monitor $5 $3 $4 2\r\n"; sleep 1) | nc $1 $2
    (echo -en "sentinel set $5 down-after-milliseconds 1000\r\n"; sleep 1) | nc $1 $2
    (echo -en "sentinel set $5 failover-timeout 1000\r\n"; sleep 1) | nc $1 $2
    (echo -en "sentinel set $5 parallel-syncs 1\r\n"; sleep 1) | nc $1 $2
}
