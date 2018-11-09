#!/bin/sh

dockerTag=$1

if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/develop/spider-java-api:${dockerTag}

docker stop spider-java-api

sleep 3


docker run -d --rm --name spider-java-api --network=host  \
           -e "SPRING_PROFILES_ACTIVE=dev" \
           -v /logs/spider-java-api:/logs/spider-java-api \
           harbor.tiejin.cn/develop/spider-java-api:${dockerTag}
