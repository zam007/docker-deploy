#!/bin/sh

teamcity_mysql_name="teamcity-mysql"
echo "run $teamcity_mysql_name"
docker stop $teamcity_mysql_name
docker rm $teamcity_mysql_name
docker run -d -v /data/mysql/teamcity:/var/lib/mysql -v /logs/mysql/teamcity:/var/logs/mysql  --name="$teamcity_mysql_name" -e "MYSQL_USER=teamcity" -e "MYSQL_PASS=umscloud_teamcity" harbor.tiejin.cn/closer/umscloud-mysql
name="teamcity"
echo "run $name"
docker stop $name
docker rm $name
docker run -d -v /root/.ssh:/root/.ssh -v /data/teamcity:/data -v /data/mvn:/root/.m2 -v /logs/TeamCity/logs:/apps/TeamCity/logs/ --name="$name" -e "TEAMCITY_DATA_PATH=/data/BuildServer" -e "JAVA_HOME=/usr/lib/jvm/java" -e "LANG=en_US.UTF-8" -e "LANGUAGE=en_US:en" --link=$teamcity_mysql_name:mysql -p 8111:8111 harbor.tiejin.cn/closer/umscloud-teamcity
