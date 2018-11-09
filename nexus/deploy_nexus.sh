#!/bin/sh

name="nexus"
echo "deploy docker $name"
docker stop ${name}
docker rm ${name}
docker run -d -v /data/sonatype-nexus:/opt/sonatype-work -p 8081:8081 --name=${name}  harbor.tiejin.cn/closer/sonatype-nexus:2.11.1
