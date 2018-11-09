#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh

docker pull harbor.tiejin.cn/closer/umscloud-fileserver:latest

docker stop umscloud-fileserver
sleep 3
docker rm umscloud-fileserver

docker run --name=umscloud-fileserver -d -p 2088:2088 \
-e UMSCLOUD_FILESERVER_OPTS="-Dserver_name=umscloud-fileserver -Denv=production -Dserver_id=$ums_server_id -Dserver_num=$ums_server_num\
        -server -Xmx3600m -Xms3600m -Xss512k -Dfile.encoding=utf-8 -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m\
                               -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                               -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                               -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                               -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                               -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                               -Dsun.net.inetaddr.ttl=60 \
                               -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/logs/server/jvm_$time.hprof "\
    -v /root/.aws:/root/.aws \
    -v /data/umscloud-fileserver/storage:/data/umscloud-fileserver/storage \
    -v /logs/umscloud-fileserver/:/logs/server/ harbor.tiejin.cn/closer/umscloud-fileserver:latest

checkserver 127.0.0.1 2088
