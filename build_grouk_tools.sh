#!/bin/sh

docker build --rm=true -t grouk-tools .
docker tag -f grouk-tools harbor.tiejin.cn/closer/grouk-tools
docker push harbor.tiejin.cn/closer/grouk-tools
