FROM harbor.tiejin.cn/closer/umscloud-base
MAINTAINER jolestar <jolestar@gmail.com>
RUN yum -y install mysql-community-common-5.6.20
RUN yum -y install mysql-community-libs-5.6.20
RUN yum -y install mysql-community-client-5.6.20

RUN yum -y install traceroute net-tools

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*
RUN mkdir /deploy

COPY . /deploy/
