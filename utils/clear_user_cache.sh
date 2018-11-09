#!/bin/bash

cmd=""
for uid in `cat $1`
do
    cmd="${uid}.user "${cmd}
done
#delete uid->user cache
(echo -en "del $cmd\r\n\r\n;"; sleep 1)|nc redis-store-comm-001.jjgkie.0001.cnn1.cache.amazonaws.com.cn 6379

#delete teamID->username,uid cache
teamID=$2
(echo -en "del $teamID.team_users\r\n\r\n;"; sleep 1)|nc redis-store-comm-001.jjgkie.0001.cnn1.cache.amazonaws.com.cn 6379