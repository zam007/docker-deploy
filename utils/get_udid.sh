#!/bin/sh

push_token=$1
(echo -en "get push_udid.XIAOMI.$push_token\r\n\r\n"; sleep 1)|nc redis-store-comm-001.jjgkie.0001.cnn1.cache.amazonaws.com.cn 6379
