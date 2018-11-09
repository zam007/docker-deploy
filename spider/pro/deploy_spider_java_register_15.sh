#!/bin/sh
dockerTag=$1
if [ -z "$dockerTag" ];then
    dockerTag="latest"
fi

docker pull harbor.tiejin.cn/closer/spider-java-register:${dockerTag}


docker stop spider-java-register

sleep 3


docker run -d --rm --name spider-java-register --network=host  \
           -e "SPRING_PROFILES_ACTIVE=pro_host_15" \
           -v /logs/spider-java-register:/logs/spider-java-register  \
           harbor.tiejin.cn/closer/spider-java-register:${dockerTag}
