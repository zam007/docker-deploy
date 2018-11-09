#!/usr/bin/env bash

read -r -d '' rsyslog_template <<EOF
\$ModLoad imfile
\$InputFilePollInterval 3

\$InputFileName LOG_FILE_NAME
\$InputFileTag APP_NAME
\$InputFileStateFile stat_APP_NAME
\$InputFileSeverity info
\$InputFilePersistStateInterval 20000
\$RepeatedMsgReduction off
\$InputRunFileMonitor

\$template logline_APP_NAME,"%HOSTNAME% %app-name% USER_TOKEN LOG_TYPE  LOG_FILE_NAME  _MSG_ %msg%\n"

if \$programname == 'APP_NAME' then @@LOG_SERVER;logline_APP_NAME
if \$programname == 'APP_NAME' then stop
EOF


#get options
shopt -o -s xtrace

while [ "$1" != "" ]; do
  case $1 in
    -s | --server ) shift
     LOG_SERVER=$1
     ;;
    -k | --key ) shift
     USER_TOKEN=$1
     ;;
    -f | --file ) shift
     LOG_FILE_NAME=$1
     ;;
    -a | --app ) shift
     APP_NAME=$1
     ;;
    --tag ) shift
     LOG_TAG=$1
     ;;
    --type ) shift
     LOG_TYPE=$1
     ;;
    --help)
      usage
      ;;
  esac
  shift
done

function usage() {
   echo "usage: config_linux.sh [-s server] -f file -k token -a appname --type logtype "
   echo "       -s|--server hostname,tcp: log server:port "
   echo "       -k|--key token: user token"
   echo "       -f|--file filename: log file to monitor "
   echo "       -a|--app appname: appname of log "
   echo "       --tag tag: tag of log "
   echo "       --type type: type of log "
   echo "       template: %HOSTNAME% %app-name% USER_TOKEN LOG_TYPE  LOG_FILE_NAME  _MSG_ %msg%\n"
   exit 1
}

if [ -z "$APP_NAME" -o -z "$USER_TOKEN" -o -z "$LOG_TYPE" -o -z "LOG_FILE_NAME" ]
then
   usage
fi


# default log server
if [ -z "$LOG_SERVER" ]
then
    LOG_SERVER=10.0.3.11:9821
fi

##check
#spool file, template file_tag


#generate rsyslog conf
CONF_FILE=/etc/rsyslog.d/21_${APP_NAME}.conf
if [ -f $CONF_FILE ]
then
   echo conf file $CONF_FILE already exists
   exit 1
fi

echo "$rsyslog_template" > /etc/rsyslog.d/21_${APP_NAME}.conf

FILE=`echo $LOG_FILE_NAME | sed -e 's/\//\\\\\//g'`
TOKEN=`echo $USER_TOKEN | sed -e 's/\//\\\\\//g'`
sed -i -e "s/USER_TOKEN/$TOKEN/g" $CONF_FILE
sed -i -e "s/LOG_TYPE/$LOG_TYPE/g" $CONF_FILE
sed -i -e "s/APP_NAME/$APP_NAME/g" $CONF_FILE
sed -i -e "s/LOG_TAG/$LOG_TAG/" $CONF_FILE
sed -i -e "s/LOG_FILE_NAME/$FILE/" $CONF_FILE
sed -i -e "s/LOG_SERVER/$LOG_SERVER/" $CONF_FILE


# restart rsyslog
echo restart rsyslog service
service rsyslog stop
service rsyslog start
