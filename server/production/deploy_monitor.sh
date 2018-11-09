#!/bin/sh

docker pull harbor.tiejin.cn/closer/ums-monitor:latest

## ums_monitor_test
docker stop ums_monitor_production
sleep 3
docker rm ums_monitor_production

docker run --name=ums_monitor_production -p 9191:9191 -d -e UMS_MONITOR_OPTS="-Denv=production \
 -server -Xmx3600m -Xms3600m -Xss512k -Dfile.encoding=utf-8 -XX:MaxMetaspaceSize=100m\
                   -XX:+UseParNewGC -XX:MaxTenuringThreshold=15 -XX:+UseConcMarkSweepGC -XX:SurvivorRatio=13 -XX:CMSInitiatingOccupancyFraction=70 -XX:TargetSurvivorRatio=100\
                   -XX:CMSMaxAbortablePrecleanTime=25000 -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -XX:CMSFullGCsBeforeCompaction=5 -XX:+UseCMSCompactAtFullCollection\
                   -XX:+UseCompressedOops -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:ParallelGCThreads=6\
                   -XX:+PrintFlagsFinal -XX:+PrintCommandLineFlags -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime\
                   -XX:+PrintGCApplicationConcurrentTime -Xloggc:/logs/server/gc_$time.log \
                   -Dsun.net.inetaddr.ttl=60 "\
    -v /logs/ums_monitor_production/:/logs/ums_monitor/ harbor.tiejin.cn/closer/ums-monitor:latest
