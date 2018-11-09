#!/bin/sh

echo "deploy all"

sh $(cd `dirname $0`; pwd)/../../redis/deploy_redis_cluster_sandbox.sh
sh $(cd `dirname $0`; pwd)/../../mysql/deploy_mysql_sandbox.sh
sh $(cd `dirname $0`; pwd)/../../mongo/deploy_mongo_sandbox.sh
sh $(cd `dirname $0`; pwd)/../../elasticsearch/deploy_es_cluster_sandbox.sh
sh $(cd `dirname $0`; pwd)/deploy_fetchserver.sh
sh $(cd `dirname $0`; pwd)/deploy_fileserver.sh
sh $(cd `dirname $0`; pwd)/deploy_searchserver.sh
sh $(cd `dirname $0`; pwd)/deploy_server.sh
sh $(cd `dirname $0`; pwd)/deploy_scheduler.sh

