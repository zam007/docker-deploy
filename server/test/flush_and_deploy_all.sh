#!/bin/sh

echo "flush data"
sh $(cd `dirname $0`; pwd)/flushdb.sh

sh $(cd `dirname $0`; pwd)/../../redis/deploy_redis_test.sh
sh $(cd `dirname $0`; pwd)/../../mysql/deploy_mysql_test.sh
sh $(cd `dirname $0`; pwd)/../../mongo/deploy_mongo_test.sh
sh $(cd `dirname $0`; pwd)/../../elasticsearch/deploy_es_cluster_test.sh
sh $(cd `dirname $0`; pwd)/deploy_fetchserver.sh
sh $(cd `dirname $0`; pwd)/deploy_fileserver.sh
sh $(cd `dirname $0`; pwd)/deploy_searchservice.sh
sh $(cd `dirname $0`; pwd)/deploy_server.sh
sh $(cd `dirname $0`; pwd)/deploy_monitor.sh

