#!/bin/sh

kubectl create -f grouk-namespace.yaml

kubectl create -f grouk-mysql-master-rc.yaml
kubectl create -f grouk-mysql-master-service.yaml
kubectl create -f grouk-mysql-slave-service.yaml

kubectl create -f grouk-tools.yaml

sleep 20

echo "init sql"
kubectl exec grouk-tools --namespace=grouk -- /deploy/mysql/init_sql.sh mysql-master 3306 umscloud_db iBcAPT8D7vRnCda
kubectl exec grouk-tools --namespace=grouk -- mysql -h mysql-master -P 3306 -u umscloud_db -piBcAPT8D7vRnCda  -e "show databases;"

kubectl create -f grouk-redis-rc.yaml
kubectl create -f grouk-redis-service.yaml

kubectl create -f grouk-mongo-rc.yaml
kubectl create -f grouk-mongo-service.yaml

kubectl create -f grouk-elasticsearch-rc.yaml
kubectl create -f grouk-elasticsearch-service.yaml

sleep 10

kubectl create -f grouk-api-rc.yaml
kubectl create -f grouk-api-service.yaml

sleep 10
kubectl exec grouk-tools --namespace=grouk -- curl http://api/command/help.ping

kubectl create -f grouk-file-rc.yaml
kubectl create -f grouk-file-service.yaml

sleep 10
kubectl exec grouk-tools --namespace=grouk -- curl http://file/command/help.ping

kubectl create -f grouk-fetch-rc.yaml
kubectl create -f grouk-fetch-service.yaml

sleep 10
kubectl exec grouk-tools --namespace=grouk -- curl http://fetch/command/help.ping

kubectl create -f grouk-search-rc.yaml
kubectl create -f grouk-search-service.yaml

sleep 10
kubectl exec grouk-tools --namespace=grouk -- curl http://search/search/data

kubectl create -f grouk-web-rc.yaml
kubectl create -f grouk-web-service.yaml

sleep 10
kubectl exec grouk-tools --namespace=grouk -- curl http://web/ping.html

#rebuild index
kubectl exec grouk-tools --namespace=grouk -- curl -H "Authorization: GroukAuth 1.8a2bd64467bfb182ff8c2f0755f2c6e18d4c841f51e64e078b567b6da247bae9" "http://api/command/search.reset" -d "objectType=1&clearOld=true"

