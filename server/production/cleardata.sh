#!/bin/bash

function login() {
    today=`date +'%y%m%d'`
    echo `curl -d"email=grouk@$1&tokenType=code&token=${today}&protocol=GW" http://localhost:8080/command/auth.login`
}

function getcode() {
   echo `echo $1 | egrep -o 'code\":[0-9]+' | awk -F: '{print $2}'`
}

function authorization() {
   echo `echo $1 | egrep -o 'token\":\"[a-z0-9.]+' | awk -F\" '{print $3}'`
}

function logout() {
    echo `curl -H"Authorization: GroukAuth ${auth}" http://localhost:8080/command/auth.logout`
}


# clear team data
teamdomain=${1:-test.umscloud.com}
echo $teamdomain
result=`login $teamdomain`
code=`getcode $result`
if [ $code -eq 0 ]; then
    auth=`authorization $result`
    echo `curl -H"Authorization: GroukAuth ${auth}" -d"domain=$teamdomain" http://localhost:8080/command/message.clear`
    echo `curl -H"Authorization: GroukAuth ${auth}" -d"domain=$teamdomain" http://localhost:8080/command/group.clear`
    echo `curl -H"Authorization: GroukAuth ${auth}" -d"domain=$teamdomain" http://localhost:8080/command/user.clear`
fi
