#!/bin/sh

echo "clean stop container"
docker ps -aq|xargs -r docker rm
echo "clean untag image"
docker images -f "dangling=true" -q|xargs -r docker rmi
echo "clean old images"
docker images | grep "weeks ago" | awk "{print \$3}"|xargs -r docker rmi
