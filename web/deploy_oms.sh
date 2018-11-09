#!/bin/sh
. $(cd `dirname $0`; pwd)/../server/basefunction.sh

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/closer-oms:${dockerTag}

docker stop closer-oms

sleep 3

docker rm closer-oms

mkdir -p /logs/web/nginx
docker run --name=closer-oms -v /logs/web/closer-oms:/apps/closer-oms/log -d -p 3334:3334 harbor.tiejin.cn/develop/closer-oms:${dockerTag}



#checkserver 127.0.0.1 3500

