#!/bin/bash

source $(cd `dirname $0`; pwd)/redis_base_function.sh
runRedis test_redis 46379
