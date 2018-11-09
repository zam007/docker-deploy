#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh

docker pull harbor.tiejin.cn/closer/umscloud-searchserver:latest

docker stop umscloud-searchserver
sleep 3
docker rm umscloud-searchserver

docker run --name=umscloud-searchserver -d -p 6666:6666 \
    -e UMSCLOUD_SEARCHSERVER_OPTS="-Dserver_name=umscloud-searchserver -Denv=production -Dserver_id=ums_searchservice_$ums_sever_num \
    -server -Xmx3600m -Xms3600m -Xss512k -Dfile.encoding=utf-8 -XX:MaxMetaspaceSize=100m\
                           -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                           -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                           -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                           -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                           -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                           -Dsun.net.inetaddr.ttl=60 \
                           -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/logs/server/jvm_$time.hprof "\
    -v /data/ums_searchserver/storage:/data/umscloud_searchserver/storage \
    -v /logs/umscloud-searchserver/:/logs/server/ harbor.tiejin.cn/closer/umscloud-searchserver:latest \
    es-datacenter 10.0.5.242:9300,10.0.5.228:9300,10.0.5.190:9300

#checkserver 127.0.0.1 2088
