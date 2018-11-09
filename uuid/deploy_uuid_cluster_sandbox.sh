#!/bin/sh

docker stop uuid_1
docker stop uuid_2
sleep 3
docker rm uuid_1
docker rm uuid_2

docker run --name=uuid_1 -d -p 6000:6000  -v /data/:/data/ harbor.tiejin.cn/closer/umscloud-uuid:latest -u 1
docker run --name=uuid_2 -d -p 16000:6000  -v /data/:/data/ harbor.tiejin.cn/closer/umscloud-uuid:latest -u 2
