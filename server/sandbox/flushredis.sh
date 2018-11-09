#!/bin/sh

(echo -en "flushall\r\n"; sleep 1) | nc 127.0.0.1 6379
(echo -en "flushall\r\n"; sleep 1) | nc 127.0.0.1 16379
(echo -en "flushall\r\n"; sleep 1) | nc 127.0.0.1 6380
(echo -en "flushall\r\n"; sleep 1) | nc 127.0.0.1 16380
