#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh

mkdir -p /data/umscloud-server/conf
cp $(cd `dirname $0`; pwd)/../cluster/cluster_test.json /data/umscloud-server/conf/cluster.json

docker pull harbor.tiejin.cn/closer/umscloud-server:latest

## ums_server_test_0
docker stop ums_server_test_0

sleep 3

docker rm -v ums_server_test_0

docker run --name=ums_server_test_0 -d -p 8081:8081 -p 8080:8080  -p 8088:8088 -p 8099:8099 -p 8098:8098 -p 8082:8082 -p 9821:9821\
    --add-host "redis mongo mysql logger-center mysql-master mysql-slave":10.0.1.6\
    -e UMSCLOUD_SERVER_OPTS="-Denv=test -Dserver_id=ums_server_0 -Dserver_num=0 -Dumscloud_outerip=10.0.1.6 -Djava.rmi.server.hostname=0.0.0.0\
     -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=8098 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8099,suspend=n  \
      -server -Xmx3600m -Xss512k -Dfile.encoding=utf-8 -XX:MaxMetaspaceSize=100m\
                      -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                      -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                      -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                      -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                      -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                      -Dsun.net.inetaddr.ttl=60 \
                      -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/logs/server/jvm_$time.hprof "\
    -v /data/umscloud-server/conf:/data/umscloud-server/conf \
    -v /root/.aws:/root/.aws \
    -v /logs/ums_server_test_0/:/logs/server/ harbor.tiejin.cn/closer/umscloud-server:latest


checkserver 127.0.0.1 8080

