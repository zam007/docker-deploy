#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh

docker pull harbor.tiejin.cn/closer/umscloud-scheduler:latest

docker stop umscloud-scheduler
sleep 3
docker rm umscloud-scheduler

docker run --name=umscloud-scheduler -d -p 8085:8085 \
-e UMSCLOUD_SCHEDULER_OPTS="-Dserver_name=umscloud-scheduler -Denv=production -Dserver_id=$ums_server_id -Dserver_num=$ums_server_num\
        -server -Xmx3600m -Xms3600m -Xss512k -Dfile.encoding=utf-8 -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m\
                               -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                               -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                               -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                               -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                               -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                               -Dsun.net.inetaddr.ttl=60 \
                               -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/logs/server/jvm_$time.hprof "\
    -v /root/.aws:/root/.aws \
    -v /data/umscloud-scheduler/storage:/data/umscloud-scheduler/storage \
    -v /logs/umscloud-scheduler/:/logs/server/ harbor.tiejin.cn/closer/umscloud-scheduler:latest

#checkserver 127.0.0.1 8085
