#!/bin/sh
. $(cd `dirname $0`; pwd)/../server/basefunction.sh

dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/closer-sadmin:${dockerTag}

docker stop closer-sadmin

sleep 3

docker rm closer-sadmin

mkdir -p /logs/web/nginx
docker run --name=closer-sadmin -v /logs/web/closer-super-admin-new:/apps/closer-super-admin-new/log -d -p 5555:5555 harbor.tiejin.cn/develop/closer-sadmin:${dockerTag}

#checkserver 127.0.0.1 3602