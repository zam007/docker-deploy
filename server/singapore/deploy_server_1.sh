#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh
mkdir -p /data2/data/umscloud-server/conf
cp $(cd `dirname $0`; pwd)/../cluster/cluster_singapore.json /data/umscloud-server/conf/cluster.json

docker pull docker.tiejin.cn/umscloud-server:latest

docker stop ums_server_singapore_1

sleep 3

docker rm -v ums_server_singapore_1

docker run --name=ums_server_singapore_1 -d -p 8081:8081 -p 8080:8080 -p 8088:8088 -p 8099:8099 -p 8082:8082 -p 9821:9821\
    -e UMSCLOUD_SERVER_OPTS="-Denv=singapore -Dserver_id=ums_server_1 -Dserver_num=1 -Dcluster_id=1 -Dums_test_model=auto -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8099,suspend=n \
    -server -Xmx3600m -Xss512k -Dfile.encoding=utf-8 -XX:MaxMetaspaceSize=100m\
                           -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                           -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                           -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                           -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                           -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                           -Dsun.net.inetaddr.ttl=60 "\
    -v /data/umscloud-server/conf:/data/umscloud-server/conf \
    -v /root/.aws:/root/.aws \
    -v /data2/logs/ums_server_singapore_1/:/logs/server/ docker.tiejin.cn/umscloud-server:latest \

checkserver 127.0.0.1 8080