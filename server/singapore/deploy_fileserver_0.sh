#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh

docker pull docker.tiejin.cn/umscloud-fileserver:latest

## ums_fileserver_singapore_0
docker stop ums_fileserver_singapore_0
sleep 3
docker rm -v ums_fileserver_singapore_0

docker run --name=ums_fileserver_singapore_0 -d -p 2088:2088 -p 2099:2099 -e UMSCLOUD_FILESERVER_OPTS="-Denv=singapore\
 -server -Xmx3600m -Xss512k -Dfile.encoding=utf-8 -XX:MaxMetaspaceSize=100m\
                   -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=2099,suspend=n \
                   -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                   -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                   -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                   -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                   -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                   -Dsun.net.inetaddr.ttl=60 "\
    -v /root/.aws:/root/.aws \
    -v /data2/data/umscloud-fileserver/storage:/data/umscloud-fileserver/storage \
    -v /data2/logs/ums_fileserver_singapore_0/:/logs/server/ docker.tiejin.cn/umscloud-fileserver:latest

#checkserver 127.0.0.1 2088
