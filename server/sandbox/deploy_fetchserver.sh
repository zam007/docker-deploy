#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi


docker pull harbor.tiejin.cn/develop/umscloud-fetchserver:${dockerTag}

## ums_fetchserver_sandbox_0
docker stop ums_fetchserver_sandbox_0
sleep 3
docker rm -v ums_fetchserver_sandbox_0

docker run --name=ums_fetchserver_sandbox_0 -d -p 6789:6789 -e UMSCLOUD_FETCHSERVER_OPTS="-Denv=sandbox\
 -server -Xmx3600m -Xss512k -Dfile.encoding=utf-8 -XX:MaxMetaspaceSize=100m\
                   -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                   -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                   -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                   -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                   -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                   -Dsun.net.inetaddr.ttl=60 "\
    -v /data/umscloud-fetchserver/storage:/data/umscloud-fetchserver/storage \
    -v /logs/ums_fetchserver_sandbox_0/:/logs/server/ harbor.tiejin.cn/develop/umscloud-fetchserver:${dockerTag}

#checkserver 127.0.0.1 6789
