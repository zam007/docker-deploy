#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/umscloud-searchserver:${dockerTag}

## ums_searchservice_sandbox_0
docker stop ums_searchserver_sandbox_0
sleep 3
docker rm -v ums_searchserver_sandbox_0

docker run --name=ums_searchserver_sandbox_0 -d -p 6666:6666 -p 8699:8699 \
    -e UMSCLOUD_SEARCHSERVER_OPTS="-Denv=sandbox -Dserver_id=ums_searchservice_0 -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8699,suspend=n \
     -server -Xmx3600m -Xss512k -Dfile.encoding=utf-8 -XX:MaxMetaspaceSize=100m\
                       -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                       -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                       -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                       -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                       -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                       -Dsun.net.inetaddr.ttl=60 "\
    -v /data/ums_searchserver_sandbox_0/storage:/data/umscloud_searchserver/storage \
    -v /logs/ums_searchserver_sandbox_0/:/logs/server/ harbor.tiejin.cn/develop/umscloud-searchserver:${dockerTag} \
    umscloud_es_sandbox 10.0.1.7:9300,10.0.1.7:19300

#checkserver 127.0.0.1 2088
