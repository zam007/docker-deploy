#!/bin/sh

echo "clean"

kubectl delete pod grouk-tools --namespace=grouk 

kubectl delete rc mysql-master --namespace=grouk 
kubectl delete service mysql-slave --namespace=grouk 
kubectl delete service mysql-master --namespace=grouk 

kubectl delete rc redis --namespace=grouk 
kubectl delete service redis --namespace=grouk 

kubectl delete rc mongo --namespace=grouk 
kubectl delete service mongo --namespace=grouk 

kubectl delete rc elasticsearch --namespace=grouk 
kubectl delete service elasticsearch --namespace=grouk 

kubectl delete rc api --namespace=grouk 
kubectl delete service api --namespace=grouk 

kubectl delete rc file --namespace=grouk 
kubectl delete service file --namespace=grouk 

kubectl delete rc fetch --namespace=grouk 
kubectl delete service fetch --namespace=grouk 

kubectl delete rc search --namespace=grouk 
kubectl delete service search --namespace=grouk 

kubectl delete rc web --namespace=grouk 
kubectl delete service web --namespace=grouk 

kubectl delete namespace grouk
