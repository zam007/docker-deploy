#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh

docker pull harbor.tiejin.cn/closer/umscloud-fetchserver:latest

docker stop umscloud-fetchserver
sleep 3
docker rm umscloud-fetchserver

docker run --name=umscloud-fetchserver -d -p 6789:6789 \
-e UMSCLOUD_FETCHSERVER_OPTS="-Dserver_name=umscloud-fetchserver -Denv=production -Dserver_id=$ums_server_id -Dserver_num=$ums_server_num\
        -server -Xmx3600m -Xms3600m -Xss512k -Dfile.encoding=utf-8 -XX:MaxMetaspaceSize=100m\
                               -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                               -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                               -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                               -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                               -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                               -Dsun.net.inetaddr.ttl=60 \
                               -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/logs/server/jvm_$time.hprof "\
    -v /data/umscloud-fetchserver/storage:/data/umscloud-fetchserver/storage \
    -v /logs/umscloud-fetchserver/:/logs/server/ harbor.tiejin.cn/closer/umscloud-fetchserver:latest

#checkserver 127.0.0.1 6789
