#!/bin/sh

docker stop test_mongo
docker rm test_mongo
docker run --name test_mongo -p 27017:27017 -d -v /apps/mongo/mongod.conf:/etc/mongod.conf -v /data/mongo:/data/db -v /logs/mongo:/var/log/mongodb/ harbor.tiejin.cn/closer/mongo:3.0

