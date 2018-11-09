#!/bin/sh
. $(cd `dirname $0`; pwd)/../server/basefunction.sh

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/closer-admin:${dockerTag}

docker stop closer-admin

sleep 3

docker rm closer-admin

mkdir -p /logs/web/nginx
docker run --name=closer-admin -v /logs/web/closer-admin:/apps/closer-admin/log -d -p 3333:3333 harbor.tiejin.cn/develop/closer-admin:${dockerTag}

#checkserver 127.0.0.1 3333

