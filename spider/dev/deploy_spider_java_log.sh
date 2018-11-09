#!/bin/sh

dockerTag=$1

if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/spider-java-log:${dockerTag}

docker stop spider-java-log

sleep 3


docker run -d --rm --name spider-java-log  --network=host \
           -e "SPRING_PROFILES_ACTIVE=dev" \
           -v /logs/spider-java-log:/logs/spider-java-log  \
           harbor.tiejin.cn/develop/spider-java-log:${dockerTag}
