#!/bin/sh

echo "flush db"
sh $(cd `dirname $0`; pwd)/flushdb.sh

echo "flush redis"
sh $(cd `dirname $0`; pwd)/flushredis.sh

echo "flush mongo"
sh $(cd `dirname $0`; pwd)/flushmongo.sh

echo "flush es"
sh $(cd `dirname $0`; pwd)/flushelastic.sh
