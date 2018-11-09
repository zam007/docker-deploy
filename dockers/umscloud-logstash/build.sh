#!/bin/bash

filename="umscloud-logstash"

echo ${filename}

docker build --rm=true -t ${filename} .
docker tag -f ${filename} harbor.tiejin.cn/closer/${filename}
docker push harbor.tiejin.cn/closer/${filename}


