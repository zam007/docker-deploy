#!/usr/bin/env bash

if [[ $# -lt 1 ]]; then
        echo "please input project name: wenxue|ski|adminwx|gi" && exit 0;
fi

echo "start deploy $1 project (sandbox env)..."
cd /var/lib/tomcat/webapps

#停止tomcat
ps aux|grep tomcat
PROCESS=`ps -ef|grep tomcat|grep -v grep|grep -v PPID|awk '{ print $2}'`
for i in $PROCESS
do
  echo "Kill the $1 process [ $i ]"
  kill -9 $i
done

#deploy migu sandbox
if [[ $1 = "wenxue" ]]; then
    rm -rf wenxue*
	/data/deploy/nexus/get_file_from_nexus.sh -i migu:wenxue:0.0.1-SNAPSHOT
#deploy ski sandbox
elif [[ $1 = "ski" ]]; then
    rm -rf ski*
	/data/deploy/nexus/get_file_from_nexus.sh -i com.yundong:ski:1.0-SNAPSHOT
#deploy adminwx sandbox
elif [[ $1 = "adminwx" ]]; then
    rm -rf adminwx*
	/data/deploy/nexus/get_file_from_nexus.sh -i migu:adminwx:0.0.1-SNAPSHOT
#deploy gi sandbox
elif [[ $1 = "gi" ]]; then
    rm -rf gi*
	/data/deploy/nexus/get_file_from_nexus.sh -i com.gigadgets:gi:1.0-SNAPSHOT
#deploy ethTrader sandbox
elif [[ $1 = "ethTrader" ]]; then
    rm -rf ethTrader*
	/data/deploy/nexus/get_file_from_nexus.sh -i com.ethTrader:EthTrader:1.0-SNAPSHOT
else
	echo "project $1 not found" && exit 0;
fi

#启动tomcat
tomcat start

#日志处理
\cp --force /logs/catalina.out /var/lib/tomcat/webapps/ROOT/
tt=`date "+%Y%m%d%H%M"`
cd /logs
cp catalina.out catalina.out.$tt
echo > catalina.out
find /logs/ -mtime +3 -name "catalina.*" -exec rm -rf {} \;


echo "deploy $1 project finished (sandbox env)"

