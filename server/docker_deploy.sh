#!/bin/sh

args="$@"

function usage(){
	echo "Usage: deploy.sh upgrade|restart|stop server_id[0,1,2,...]";
	exit 1
}

function stop(){
    echo "server_id::$server_id"
    docker stop umscloud-server-deploy_$server_id
    sleep 3
    docker rm umscloud-server-deploy_$server_id
}

function pull(){
    docker pull docker.iocloud.io/iocloud-server-deploy:latest
    echo "pulled latest image"
}

function run(){
    docker run --name=umscloud-server-deploy_"$server_id" -d -p 8"$server_id"80:8080 -p 8"$server_id"81:8081 -p 8"$server_id"82:8082 -p 8"$server_id"84:8084 -e UMSCLOUD_SERVER_OPTS="-Denv=sandbox -Dums_serverid=umscloud_server_$server_id" --link=redis_1:redis --link=iocloud-server-mysql:mysql -v /data/umscloud-server/conf:/data/umscloud-server/conf -v /logs/iocloud-server-$server_id/:/logs/iocloud-server/ docker.iocloud.io/iocloud-server-deploy:latest
}

[[ -z $1 || -z $2 ]] && usage

server_id=$2

case "$1" in
    upgrade)
        stop
        pull
        run
        ;;
    restart)
        stop
        run
        ;;
    stop)
        stop
        ;;
esac

echo "done"