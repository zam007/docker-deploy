#!/bin/sh

. $(cd `dirname $0`; pwd)/../basefunction.sh
mkdir -p /data/umscloud-server/conf
cp $(cd `dirname $0`; pwd)/../cluster/cluster_sandbox.json /data/umscloud-server/conf/cluster.json

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

## deploy ums_cloud_server_sandbox
docker pull harbor.tiejin.cn/develop/umscloud-server:${dockerTag}

docker stop ums_server_sandbox_0

docker stop ums_server_sandbox_1

sleep 3

docker rm -v ums_server_sandbox_0

docker rm -v ums_server_sandbox_1

docker run --name=ums_server_sandbox_0 -d -p 8081:8081 -p 8080:8080 -p 8088:8088 -p 8099:8099 -p 8082:8082 -p 9821:9821\
    -e UMSCLOUD_SERVER_OPTS="-Denv=sandbox -Dserver_id=ums_server_0 -Dserver_num=0 -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8099,suspend=n \
    -server -Xmx3600m -Xss512k -Dfile.encoding=utf-8 -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m\
                           -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                           -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                           -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                           -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                           -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                           -Dsun.net.inetaddr.ttl=60 "\
    -v /data/umscloud-server/conf:/data/umscloud-server/conf \
    -v /root/.aws:/root/.aws \
    -v /logs/ums_server_sandbox_0/:/logs/server/ harbor.tiejin.cn/develop/umscloud-server:${dockerTag} \

docker run --name=ums_server_sandbox_1 -d -p 8181:8081 -p 8180:8080 -p 8188:8088 -p 8199:8099 -p 8182:8082\
    -e UMSCLOUD_SERVER_OPTS="-Denv=sandbox -Dserver_id=ums_server_1 -Dserver_num=1 -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8099,suspend=n \
    -server -Xmx3600m -Xss512k -Dfile.encoding=utf-8 -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m\
                           -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                           -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                           -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                           -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                           -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                           -Dsun.net.inetaddr.ttl=60 "\
    -v /data/umscloud-server/conf:/data/umscloud-server/conf \
    -v /root/.aws:/root/.aws \
    -v /logs/ums_server_sandbox_1/:/logs/server/ harbor.tiejin.cn/develop/umscloud-server:${dockerTag}

## deploy ums_scheduler_sandbox

docker pull harbor.tiejin.cn/develop/umscloud-scheduler:${dockerTag}

docker stop ums_scheduler_sandbox

sleep 3

checkserver 127.0.0.1 8080
checkserver 127.0.0.1 8180

