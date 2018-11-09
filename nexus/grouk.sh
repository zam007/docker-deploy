#!/bin/bash

cd /data/deploy
git pull origin master

cd /tmp
echo " Make sure you have upload the grouk file to nexus..."

/data/deploy/nexus/get_file_from_nexus.sh -i com.umscloud:ums-deploy:1.0.0.BUILD-SNAPSHOT -c all -p jar

java -jar ums-deploy.jar