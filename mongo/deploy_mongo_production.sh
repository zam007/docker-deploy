#!/bin/sh


docker stop product_mongo
docker rm  product_mongo

docker run --name product_mongo -p 27017:27017 -d -v /data/db/mongo:/data/db harbor.tiejin.cn/closer/mongo:3.2 --replSet "rs_prod" --wiredTigerCacheSizeGB 2
