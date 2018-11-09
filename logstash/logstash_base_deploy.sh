#!/bin/sh

cluster=$1
host=""

IFS=',' read -ra ADDR <<< "$2"
for i in "${ADDR[@]}"; do
    host=${host},\"$i\"
done
host=${host:1}

baseCondition="output {
 	elasticsearch {
      	template_name => \"${cluster}\"
 		codec => fluent
 		index => \"grouk-%{tags}-log-%{+YYYY.MM.dd}\"
 		hosts => [${host}]
 	}

   http{
      url=>\"http://10.0.1.7:9821/command/log.process\"
      http_method=>\"post\"
      format => \"json\"
	}
}"

docker pull harbor.tiejin.cn/closer/umscloud-logstash

docker stop logstash
sleep 3
docker rm logstash

mkdir -p /apps/logstash/config

echo $baseCondition > /apps/logstash/config/output.conf

docker run --name=logstash -d -p 1224:1224 -v /apps/logstash/config/output.conf:/apps/logstash/config/output.conf harbor.tiejin.cn/closer/umscloud-logstash:latest

