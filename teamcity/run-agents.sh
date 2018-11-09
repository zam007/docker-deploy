#!/bin/sh

echo "run agent one"
docker stop teamcity-agent-one
docker rm teamcity-agent-one
docker run -d --privileged=true -v /root/.ssh:/root/.ssh -v /data/teamcity:/data -v /data/mvn:/root/.m2 -v /var/lib/docker:/var/lib/docker -v /logs/TeamCity/buildAgentOne/logs/:/apps/TeamCity/buildAgent/logs/ -v /apps/TeamCity/buildAgent/conf-one:/apps/TeamCity/buildAgent/conf -v /data/TeamCity/buildAgentOne/work/:/apps/TeamCity/buildAgent/work/ -v /data/TeamCity/buildAgentOne/temp/:/apps/TeamCity/buildAgent/temp/ -v /data/TeamCity/buildAgentOne/gradle:/root/.gradle  -p 9090:9090 --name="teamcity-agent-one" --link=teamcity:master -e TEAMCITY_DATA_PATH=/data/BuildServer -e OWNER_ADDRESS=192.168.1.2 -e OWNER_PORT=9090 -e JAVA_HOME=/usr/lib/jvm/java -e DOCKER_HOST=192.168.1.2:4243 -e LANG=en_US.UTF-8 -e LANGUAGE=en_US:en  harbor.tiejin.cn/closer/umscloud-teamcity-agent

echo "run agent two"
docker stop teamcity-agent-two
docker rm teamcity-agent-two

docker run -d --privileged=true -v /root/.ssh:/root/.ssh -v /data/teamcity:/data -v /data/mvn:/root/.m2 -v /var/lib/docker:/var/lib/docker -v /logs/TeamCity/buildAgentTwo/logs/:/apps/TeamCity/buildAgent/logs/ -v /apps/TeamCity/buildAgent/conf-two:/apps/TeamCity/buildAgent/conf -v /data/TeamCity/buildAgentTwo/work/:/apps/TeamCity/buildAgent/work/ -v /data/TeamCity/buildAgentTwo/temp/:/apps/TeamCity/buildAgent/temp/  -v /data/TeamCity/buildAgentTwo/gradle:/root/.gradle  -p 9091:9091 --name="teamcity-agent-two" --link=teamcity:master -e TEAMCITY_DATA_PATH=/data/BuildServer -e OWNER_ADDRESS=192.168.1.2 -e OWNER_PORT=9091 -e JAVA_HOME=/usr/lib/jvm/java -e DOCKER_HOST=192.168.1.2:4243 -e LANG=en_US.UTF-8 -e LANGUAGE=en_US:en  harbor.tiejin.cn/closer/umscloud-teamcity-agent

echo "run agent three"
docker stop teamcity-agent-three
docker rm teamcity-agent-three

docker run -d --privileged=true -v /root/.ssh:/root/.ssh -v /data/teamcity:/data -v /data/mvn:/root/.m2 -v /var/lib/docker:/var/lib/docker -v /logs/TeamCity/buildAgentThree/logs/:/apps/TeamCity/buildAgent/logs/ -v /apps/TeamCity/buildAgent/conf-three:/apps/TeamCity/buildAgent/conf -v /data/TeamCity/buildAgentThree/work/:/apps/TeamCity/buildAgent/work/ -v /data/TeamCity/buildAgentThree/temp/:/apps/TeamCity/buildAgent/temp/ -v /data/TeamCity/buildAgentThree/gradle:/root/.gradle  -p 9092:9092 --name="teamcity-agent-three" --link=teamcity:master -e TEAMCITY_DATA_PATH=/data/BuildServer -e OWNER_ADDRESS=192.168.1.2 -e OWNER_PORT=9092 -e JAVA_HOME=/usr/lib/jvm/java -e DOCKER_HOST=192.168.1.2:4243 -e LANG=en_US.UTF-8 -e LANGUAGE=en_US:en  harbor.tiejin.cn/closer/umscloud-teamcity-agent
