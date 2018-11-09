#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh

docker pull harbor.tiejin.cn/closer/umscloud-fetchserver:latest

## ums_fetchserver_test_0
docker stop ums_fetchserver_test_0
sleep 3
docker rm -v ums_fetchserver_test_0

docker run --name=ums_fetchserver_test_0 -d -p 6789:6789 -e UMSCLOUD_FETCHSERVER_OPTS="-Denv=test \
   -server -Xmx3600m -Xss512k -Dfile.encoding=utf-8 -XX:MaxMetaspaceSize=100m\
                   -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                   -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                   -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                   -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                   -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                   -Dsun.net.inetaddr.ttl=60 "\
    --add-host "redis mongo mysql logger-center mysql-master mysql-slave":10.0.1.6\
    -v /data/umscloud-fetchserver/storage:/data/umscloud-fetchserver/storage \
    -v /logs/ums_fetchserver_test_0/:/logs/server/ harbor.tiejin.cn/closer/umscloud-fetchserver:latest

#checkserver 127.0.0.1 6789
