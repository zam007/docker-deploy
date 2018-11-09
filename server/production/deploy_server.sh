#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh
mkdir -p /data/umscloud-server/confq
cp $(cd `dirname $0`; pwd)/../cluster/cluster_production.json /data/umscloud-server/conf/cluster.json

docker pull harbor.tiejin.cn/closer/umscloud-server:latest

docker stop umscloud-server

sleep 3

docker rm umscloud-server

DOCKER_HOST=`ec2metadata --local-host`
DOCKER_HOST_IP=`ec2metadata --local-ipv4`

docker run --name=umscloud-server -d -p 8081:8081 -p 8080:8080 -p 8088:8088 -p 8082:8082 -p 8083:8083 -p 8098:8098 -p 9821:9821\
    -e DOCKER_HOST="$DOCKER_HOST" -e DOCKER_HOST_IP="$DOCKER_HOST_IP" \
    -e UMSCLOUD_SERVER_OPTS="-Dserver_name=umscloud-server -Denv=production -Dserver_id=$ums_server_id -Dserver_num=$ums_server_num\
    -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=8098 -Dcom.sun.management.jmxremote.rmi.port=8098 -Djava.rmi.server.hostname=$DOCKER_HOST_IP -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false \
    -server -Xmx3600m -Xms3600m -Xmn2200m -Xss512k -Dfile.encoding=utf-8 -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m\
                           -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                           -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                           -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                           -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                           -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                           -Dsun.net.inetaddr.ttl=60 \
                           -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/logs/server/jvm_$time.hprof"\
    -v /data/umscloud-server/conf:/data/umscloud-server/conf \
    -v /root/.aws:/root/.aws \
    -v /logs/umscloud-server/:/logs/server/ harbor.tiejin.cn/closer/umscloud-server:latest \

checkserver 127.0.0.1 8080
