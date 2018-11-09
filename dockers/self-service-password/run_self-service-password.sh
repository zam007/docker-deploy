#!/bin/bash

# 10.0.0.4 为ldap server所在机器的IP
docker run --name=self-service-password -d -v /var/log/self-service-password:/var/log/httpd --add-host ldaphost:10.0.0.4 -p 19090:80 harbor.tiejin.cn/closer/umscloud-self-service-password
