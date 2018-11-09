#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh

docker pull harbor.tiejin.cn/develop/umscloud-scheduler:latest

## ums_scheduler_sandbox
docker stop ums_scheduler_sandbox
sleep 3
docker rm -v ums_scheduler_sandbox

docker run --name=ums_scheduler_sandbox -d -p 8085:8085 -e UMSCLOUD_SCHEDULER_OPTS="-Denv=sandbox\
 -server -Xmx3600m -Xss512k -Dfile.encoding=utf-8 -XX:MaxMetaspaceSize=100m\
                   -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=2099,suspend=n \
                   -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                   -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                   -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                   -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                   -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                   -Dsun.net.inetaddr.ttl=60 "\
    -v /root/.aws:/root/.aws \
    -v /data/umscloud-scheduler/storage:/data/umscloud-scheduler/storage \
    -v /logs/ums_scheduler_sandbox/:/logs/server/ harbor.tiejin.cn/develop/umscloud-scheduler:latest

#checkserver 127.0.0.1 8085
