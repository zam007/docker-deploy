#!/bin/sh
. $(cd `dirname $0`; pwd)/../server/basefunction.sh

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/closer-download:${dockerTag}

docker stop closer-download

sleep 3

docker rm closer-download

mkdir -p /logs/web/nginx
docker run --name=closer-download -v /logs/web/closer-download:/apps/closer-download/log -d -p 3600:3600 harbor.tiejin.cn/develop/closer-download:${dockerTag}

#checkserver 127.0.0.1 3600

