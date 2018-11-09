#!/bin/sh

function sendMsg(){
 time=`date +%F-%H-%M-%S`;
 curl -X POST -H "Content-Type: application/json" -d '{"text":"Bigben:'$time'"}' http://api.grouk.com/webhook/556d4244e4b00f0e1d9e95bd/JTwdMUtQ1dS6Zle70QVg
}
sendMsg
sleep 10
sendMsg
sleep 10 
sendMsg
sleep 10
sendMsg
sleep 10
sendMsg
sleep 10
sendMsg
