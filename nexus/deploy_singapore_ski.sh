#!/usr/bin/env bash

sudo echo "start..."

#拉取最新ski.war 包
cd /tmp
sudo /data/deploy/nexus/get_file_from_nexus.sh -i com.yundong:ski:1.0-SNAPSHOT

cd /data/apps/apache-tomcat-8.5.20/webapps

sudo ps aux|grep tomcat

PROCESS=`sudo  ps -ef|grep tomcat|grep -v grep|grep -v PPID|awk '{ print $2}'`
for i in $PROCESS
do
  echo "Kill the $1 process [ $i ]"
  sudo  kill -9 $i
done

sudo rm -rf ski*
sudo mv /tmp/ski.war .

\sudo  cp --force /logs/catalina.out /data/apps/apache-tomcat-8.5.20/webapps/ROOT/

tt=`date "+%Y%m%d%H%M"`
cd /logs
sudo cp catalina.out catalina.out.$tt
sudo echo > catalina.out
sudo find /logs/ -mtime +3 -name "catalina.*" -exec sudo rm -rf {} \;

sudo /data/apps/apache-tomcat-8.5.20/bin/startup.sh
