#!/bin/sh
. $(cd `dirname $0`; pwd)/../server/basefunction.sh

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/closer-h5:${dockerTag}

docker stop closer-h5

sleep 3

docker rm closer-h5

mkdir -p /logs/web/nginx
docker run --name=closer-h5 -v /logs/web/closer-h5:/apps/closer-h5/log -d -p 3601:3601 harbor.tiejin.cn/develop/closer-h5:${dockerTag}



#checkserver 127.0.0.1 3600

