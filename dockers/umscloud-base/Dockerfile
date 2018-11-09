FROM harbor.tiejin.cn/closer/centos:7
MAINTAINER jolestar <jolestar@gmail.com>
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install git
RUN rpm -iUv http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
RUN yum -y install python-pip

RUN yum -y install wget
RUN yum -y install tar
#RUN yum -y groupinstall "Development tools"

RUN yum -y install java-1.8.0-openjdk
RUN yum -y install java-1.8.0-openjdk-devel
RUN yum -y install telnet nc

VOLUME ["/root/.ssh"]

ENV JAVA_HOME /usr/lib/jvm/java


ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
