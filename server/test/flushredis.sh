#!/bin/sh

(echo -en "flushall\r\n"; sleep 1) | nc 127.0.0.1 6379
