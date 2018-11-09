#!/bin/sh

function checkserver(){
host=$1
port=$2

echo "check $host:$port"
wait_time=0
nmap ${host} -p ${port} -oG -|grep -iq "$port/open"
ret=$?
while [ ${ret} -eq 1  ];do
    echo "recheck $wait_time"
    sleep 2
    nmap ${host} -p ${port} -oG -|grep -iq "$port/open"
    ret=$?
    wait_time=$(($wait_time+2))
    if [ ${wait_time} -gt 10 ]
    then
       echo "giveup recheck."
       break
    fi
done
if [ ${ret} -eq 1 ]; then
        echo "check port $port fail."
        exit 1
else
        echo "check port $port success."
fi
wait_time=0
tmpfile=/tmp/server-check-result${port}.json
curl "http://$host:$port/command/help.ping" > ${tmpfile}
grep '"code":0' ${tmpfile}
ret=$?
while [ ${ret} -eq 1  ];do
    echo "recheck $wait_time"
    sleep 2
    curl "http://$host:$port/command/help.ping" > ${tmpfile}
    grep '"code":0' ${tmpfile}
    ret=$?
    wait_time=$(($wait_time+2))
    if [ ${wait_time} -gt 30 ]
    then
       echo "giveup recheck."
       break
    fi
done

if [ ${ret} -eq 1 ]; then
        echo "check help.ping fail."
        exit 1
else
        echo "check help.ping success."
fi
}
time=`date +%F-%H-%M-%S`
