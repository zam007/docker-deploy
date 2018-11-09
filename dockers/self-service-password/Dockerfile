FROM harbor.tiejin.cn/closer/umscloud-base
MAINTAINER guojing <guojing@umscloud.com>

ENV SSP_PATH /usr/share/self-service-password

RUN \
  cd /tmp && \
  wget http://tools.ltb-project.org/attachments/download/802/self-service-password-0.9-1.el5.noarch.rpm && \
  rpm --import http://ltb-project.org/wiki/lib/RPM-GPG-KEY-LTB-project && \
  yum -y localinstall self-service-password-0.9-1.el5.noarch.rpm && \
  yum -y install php-mcrypt

COPY httpd.conf /etc/httpd/conf/
COPY config.inc.php $SSP_PATH/conf/
COPY run.sh $SSP_PATH/

RUN chmod +x $SSP_PATH/run.sh

EXPOSE 80

CMD $SSP_PATH/run.sh
