#!/bin/sh
. $(cd `dirname $0`; pwd)/../server/basefunction.sh

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/closer-web:${dockerTag}

docker stop closer-web

sleep 3

docker rm closer-web

mkdir -p /logs/web/nginx
docker run --name=closer-web -v /logs/web/closer-web:/apps/closer-web/log -d -p 3500:3500 harbor.tiejin.cn/develop/closer-web:${dockerTag}



#checkserver 127.0.0.1 3500

