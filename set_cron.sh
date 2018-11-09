#!/usr/bin/env bash
#set cronfile in some machine to get rid of docker

function deploy(){
ip=$1
echo "crontab $ip"
ssh root@$ip "cd /data/deploy;git pull origin master;"
ssh root@$ip "cd /data/deploy;crontab cronfile"
TZ='Asia/Shanghai'; export TZ
}
deploy "10.0.0.11"
deploy "10.0.0.12"
deploy "10.0.0.13"
deploy "10.0.1.6"
deploy "10.0.1.7"
deploy "10.0.3.11"
deploy "10.0.3.12"

