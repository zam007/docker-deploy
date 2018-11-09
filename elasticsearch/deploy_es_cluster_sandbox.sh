#!/bin/sh

docker pull harbor.tiejin.cn/closer/umscloud-elasticsearch:latest

docker stop ES_1
docker stop ES_2
sleep 3
docker rm ES_1
docker rm ES_2

docker run --name=ES_1 -d -p 9200:9200 -p 9300:9300 -v /data/elasticsearch:/data/elasticsearch harbor.tiejin.cn/closer/umscloud-elasticsearch:latest --cluster.name=umscloud_es_sandbox
docker run --name=ES_2 -d -p 19200:9200 -p 19300:9300  -v /data/elasticsearch:/data/elasticsearch harbor.tiejin.cn/closer/umscloud-elasticsearch:latest --cluster.name=umscloud_es_sandbox
