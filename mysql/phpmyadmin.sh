#!/bin/sh
source $(cd `dirname $0`; pwd)/mysql_base_function.sh
test_mysql_master_ip=`runMysql phpmyadmin-mysql 3406 umscloud umscloud 10`

echo $test_mysql_master_ip

docker stop phpmyadmin
sleep 3
docker rm phpmyadmin
docker run -d --link phpmyadmin-mysql:phpmyadmin-mysql -e PMA_HOST=phpmyadmin-mysql -e PMA_PORT=3306 -e PMA_USERNAME=umscloud -e PMA_PASSWORD=umscloud --name phpmyadmin -p 8900:80 harbor.tiejin.cn/closer/umscloud-phpmyadmin
