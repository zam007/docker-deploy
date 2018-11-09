#!/bin/sh

docker build --rm=true -t umscloud-teamcity .
docker tag -f umscloud-teamcity harbor.tiejin.cn/closer/umscloud-teamcity:9.1.1
docker push harbor.tiejin.cn/closer/umscloud-teamcity:9.1.1
