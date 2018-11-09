#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh

docker pull harbor.tiejin.cn/closer/umscloud-searchserver:latest

## ums_searchservice_sandbox_0
docker stop ums_searchserver_test_0
sleep 3
docker rm -v ums_searchserver_test_0

docker run --name=ums_searchserver_test_0 -d -p 6666:6666 -p 8699:8699 \
    -e UMSCLOUD_SEARCHSERVER_OPTS="-Denv=test -Dserver_id=ums_searchservice_0 -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8699,suspend=n \
    -server -Xmx3600m -Xss512k -Dfile.encoding=utf-8 -XX:MaxMetaspaceSize=100m\
                    -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                    -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                    -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                    -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                    -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                    -Dsun.net.inetaddr.ttl=60 "\
    --add-host "redis mongo mysql logger-center mysql-master mysql-slave":10.0.1.6\
    -v /data/ums_searchserver/storage:/data/ums_searchserver/storage \
    -v /logs/ums_searchserver/:/logs/server/ harbor.tiejin.cn/closer/umscloud-searchserver:latest \
    umscloud_es_test 10.0.1.6:9300,10.0.1.6:19300

#checkserver 127.0.0.1 2088
