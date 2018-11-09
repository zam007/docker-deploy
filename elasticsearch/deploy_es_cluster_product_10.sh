#!/bin/sh

docker pull harbor.tiejin.cn/closer/umscloud-elasticsearch:latest

docker stop ES_1
sleep 3
docker rm ES_1

docker run --name=ES_1 -d -p 9200:9200 -p 9300:9300 -v /storage1/elasticsearch:/data/elasticsearch -e ES_HEAP_SIZE=20g harbor.tiejin.cn/closer/umscloud-elasticsearch:latest --cluster.name=umscloud_es_product --network.publish_host=10.0.2.10 --discovery.zen.ping.unicast.hosts=10.0.2.11
