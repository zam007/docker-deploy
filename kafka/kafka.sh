#!/bin/sh

stop(){
    local pid=`pgrep -f  "jar kafka.Kafka config/"`
    echo "find pid $pid"
    while [ ! -z "$pid" ];do
        echo "kill kafka"
        kill -9 $pid
        sleep 2
        pid=`pgrep -f  "jar kafka.Kafka config/"`
    done
    if [ ! -z "$pid" ]
    then
        echo "stop fail. please check."
        exit 1
    fi    
}

start(){
    if [ -z "$prop" ]
    then
        echo "Usage $0 start *.properties"
        exit 1
    fi
    echo "starting kafka"
    /apps/kafka/bin/kafka-server-start.sh $prop >/dev/null 2>&1 &
}

action=$1
prop=$2

case "$action" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart}"
esac

exit 0
