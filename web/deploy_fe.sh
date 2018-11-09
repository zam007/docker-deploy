#!/bin/sh
. $(cd `dirname $0`; pwd)/../server/basefunction.sh

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/closer-fe:${dockerTag}

docker stop closer-fe

sleep 3

docker rm closer-fe

mkdir -p /logs/web/nginx
docker run --name=closer-fe -v /logs/web/closer-fe:/apps/closer-fe/log -d -p 3603:3603 harbor.tiejin.cn/develop/closer-fe:${dockerTag}



#checkserver 127.0.0.1 3500

