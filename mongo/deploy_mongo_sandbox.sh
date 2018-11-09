#!/bin/sh

docker stop sandbox_mongo_rs0
docker stop sandbox_mongo_rs1

docker rm sandbox_mongo_rs0
docker rm sandbox_mongo_rs1
docker run --name sandbox_mongo_rs0 -p 27017:27017 -d  -v /data/mongo/rs0/:/data/db/  harbor.tiejin.cn/closer/mongo:3.2 --replSet "rs"
docker run --name sandbox_mongo_rs1 -p 27018:27017 -d  -v /data/mongo/rs1/:/data/db/  harbor.tiejin.cn/closer/mongo:3.2 --replSet "rs"

