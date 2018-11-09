#!/bin/sh
. $(cd `dirname $0`; pwd)/../server/basefunction.sh

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/closer-t1:${dockerTag}

docker stop closer-t1

sleep 3

docker rm closer-t1

mkdir -p /logs/web/nginx
docker run --name=closer-t1 -v /logs/web/closer-t1:/apps/closer-t1/log -d -p 3604:3604 harbor.tiejin.cn/develop/closer-t1:${dockerTag}



#checkserver 127.0.0.1 3600

