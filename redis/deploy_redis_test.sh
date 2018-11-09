#!/bin/bash

source $(cd `dirname $0`; pwd)/redis_base_function.sh

local_ip=`hostname -A`

###### run redis master & slave
test_redis_master_0_ip=`runRedis test_redis_master_0 6383`
