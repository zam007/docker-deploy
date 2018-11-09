#!/bin/sh
. $(cd `dirname $0`; pwd)/../server/basefunction.sh

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/closer-editor:${dockerTag}

docker stop closer-editor

sleep 3

docker rm closer-editor

mkdir -p /logs/web/nginx
docker run --name=closer-editor -v /logs/web/closer-editor:/apps/closer-editor/log -d -p 3337:3337 harbor.tiejin.cn/develop/closer-editor:${dockerTag}



#checkserver 127.0.0.1 3337

