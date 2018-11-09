#!/bin/bash
source $(cd `dirname $0`; pwd)/redis_base_function.sh

local_ip=`hostname -A`

###### run redis master & slave
test_redis_master_0_ip=`runRedis test_redis_master_0 6379`
test_redis_slave_0_ip=`runRedis test_redis_slave_0 16379`

slaveof ${local_ip} 6379 ${local_ip} 16379 ${test_redis_master_0_ip} 6379

###### run redis master & slave
test_redis_master_1_ip=`runRedis test_redis_master_1 6380`
test_redis_slave_1_ip=`runRedis test_redis_slave_1 16380`

slaveof ${local_ip} 6380 ${local_ip} 16380 ${test_redis_master_1_ip} 6379

#get sentinel ips
test_sentinel_0_ip=`runSentinel test_sentinel_0 26379`
test_sentinel_1_ip=`runSentinel test_sentinel_1 26380`
test_sentinel_2_ip=`runSentinel test_sentinel_2 26381`

sentinelMonitor ${local_ip} 26379 ${test_redis_master_0_ip} 6379 ums.redis_0-256
sentinelMonitor ${local_ip} 26379 ${test_redis_master_0_ip} 6379 ums.redis_256-512
sentinelMonitor ${local_ip} 26379 ${test_redis_master_1_ip} 6379 ums.redis_512-768
sentinelMonitor ${local_ip} 26379 ${test_redis_master_1_ip} 6379 ums.redis_768-1024

sentinelMonitor ${local_ip} 26380 ${test_redis_master_0_ip} 6379 ums.redis_0-256
sentinelMonitor ${local_ip} 26380 ${test_redis_master_0_ip} 6379 ums.redis_256-512
sentinelMonitor ${local_ip} 26380 ${test_redis_master_1_ip} 6379 ums.redis_512-768
sentinelMonitor ${local_ip} 26380 ${test_redis_master_1_ip} 6379 ums.redis_768-1024


sentinelMonitor ${local_ip} 26381 ${test_redis_master_0_ip} 6379 ums.redis_0-256
sentinelMonitor ${local_ip} 26381 ${test_redis_master_0_ip} 6379 ums.redis_256-512
sentinelMonitor ${local_ip} 26381 ${test_redis_master_1_ip} 6379 ums.redis_512-768
sentinelMonitor ${local_ip} 26381 ${test_redis_master_1_ip} 6379 ums.redis_768-1024