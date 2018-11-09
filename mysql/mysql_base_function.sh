#!/bin/sh

docker pull harbor.tiejin.cn/closer/umscloud-mysql:latest

#####
#
# runMysql
# 1:docker_name
# 2:port
# 3:username
# 4:password
# 5:SERVER_ID
#
#####
runMysql(){
    exec 3>&1 >&2
    echo "* Create $1"
    echo "stop: "`docker stop $1`
    sleep 3
    echo "rm: "`docker rm $1`
    rm -rf /data/mysql/$1
    rm -rf /logs/mysql/$1
    echo "run [$1]: "`docker run -d -p $2:3306 -v /data/mysql/$1:/var/lib/mysql -v /logs/mysql/$1:/var/logs/mysql --name=$1 -e MYSQL_USER=$3 -e MYSQL_PASS=$4 -e SERVER_ID=$5 harbor.tiejin.cn/closer/umscloud-mysql:latest`
    local inner_ip=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1)
    exec >&3-
    echo $inner_ip
}

#####
# 1:ip
# 2:port
# 3:username
# 4:password
#####
checkStatus(){
    echo "check status $1 $2 $3 $4"
    local uptime=$(mysql -h$1 -P$2 -u$3 -p$4 -e "status"  | grep Uptime)
    while [[ -z $uptime ]]; do
        echo "* Sleep for two seconds for servers to come online..."
        sleep 2
        uptime=$(mysql -h$1 -P$2 -u$3 -p$4 -e "status"  | grep Uptime)
    done
    echo "===================== server [ $1:$2 ] is running"
    mysql -h$1 -P$2 -u$3 -p$4 -e "status"
}
#####
#
# doReplication
# 1:master_ip
# 2:master_port
# 3:slave_ip
# 4:slave_port
# 5:uname
# 6:passwd
# 7:master_rep_ip
# 8:master_rep_port
# 9:slave_rep_ip
# 10:slave_rep_port
#
#####
doReplication(){
    echo "* Creat replication user"
    mysql -h$1 -P$2 -u$5 -p$6 -AN -e 'GRANT REPLICATION SLAVE ON *.* TO "replication"@"%" IDENTIFIED BY "password";'
    mysql -h$1 -P$2 -u$5 -p$6 -AN -e 'flush privileges;'

    echo "* Export Data from master[$1:$2] to slave[$3:$4]"
    mysqldump -h$1 -P$2 -u$5 -p$6 --single-transaction --all-databases --flush-privileges | mysql -h$3 -P$4 -u$5 -p$6

    echo "* Set master[$1:$2] as master on slave[$3:$4]"
    mysql_master_Position=$(mysql -h$1 -P$2 -u$5 -p$6 -e "show master status \G" | grep Position | awk '{print $2}')
    mysql_master_File=$(mysql -h$1 -P$2 -u$5 -p$6 -e "show master status \G"     | grep File     | awk '{print $2}')
    echo "change master : $7 | $8"
    mysql -u$5 -p$6 -h$3 -P$4 -AN -e "CHANGE MASTER TO master_host='$7', master_port=$8, \
	    master_user='replication', master_password='password', master_log_file='$mysql_master_File', \
	    master_log_pos=$mysql_master_Position;"

    echo "* Set slave[$3:$4] as master on master[$1:$2]"
    mysql_slave_Position=$(mysql -h$3 -P$4 -u$5 -p$6 -e "show master status \G" | grep Position | awk '{print $2}')
    mysql_slave_File=$(mysql -h$3 -P$4 -u$5 -p$6 -e "show master status \G"     | grep File     | awk '{print $2}')

    echo "change master : $9 | ${10}"
    mysql -h$1 -P$2 -u$5 -p$6 -AN -e "CHANGE MASTER TO master_host='$9', master_port=${10}, \
	    master_user='replication', master_password='password', master_log_file='$mysql_slave_File', \
	    master_log_pos=$mysql_slave_Position;"

    echo "* Start Slave on both Servers"
    mysql -h$1 -P$2 -u$5 -p$6 -AN -e "start slave;"
    mysql -h$3 -P$4 -u$5 -p$6 -AN -e "start slave;"

    echo "* Create database 'replicationCheckDb' on master"
    mysql -h$1 -P$2 -u$5 -p$6 -e "create database replicationCheckDb;"

    echo "* Sleep 2 seconds, then check that database 'replicationCheckDb' exists on slave"
    sleep 5
    mysql -h$3 -P$4 -u$5 -p$6 -e "show databases; \G" | grep replicationCheckDb

    echo "MySQL servers created!"
    echo "--------------------"
    echo
    echo Variables available fo you :-
    echo
    echo mysql_master_ip      : $1:$2
    echo mysql_slave_ip       : $3:$4
}















