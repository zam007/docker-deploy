#!/bin/sh

registry_redis_name="registry-redis"
echo "run $registry_redis_name"
docker stop ${registry_redis_name}
docker rm ${registry_redis_name}
docker run -d -v /data/redis/registry:/data -v /logs/redis/registry:/logs  -e "REDIS_MAXMEMORY=256m" --name=${registry_redis_name}  harbor.tiejin.cn/closer/umscloud-redis
name="docker-registry"
docker stop ${name}
docker rm ${name}
docker run -d -v /data/docker-registry:/data  -p 5000:5000 -e "DOCKER_REGISTRY_CONFIG=/data/config/config.yml" -e "SETTINGS_FLAVOR=prod" --name="docker-registry" --link="$registry_redis_name:redis" registry
