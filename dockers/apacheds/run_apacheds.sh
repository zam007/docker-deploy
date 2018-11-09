#!/bin/bash

docker run -d  --name=apacheds -v /data/apacheds/partitions:/data/apacheds/partitions -v /data/apacheds/log:/data/apacheds/log  -p 10636:10636 -p 10389:10389 harbor.tiejin.cn/closer/umscloud-apacheds
