FROM harbor.tiejin.cn/closer/umscloud-base
MAINTAINER guojing@umscloud.com

ENV APACHE_DS_VERSION 2.0.0-M24
ENV APACHE_DS apacheds-$APACHE_DS_VERSION

EXPOSE 10389
EXPOSE 10636

# install by rpm
RUN \
  cd /tmp && \
  wget http://mirror.bit.edu.cn/apache/directory/apacheds/dist/$APACHE_DS_VERSION/$APACHE_DS-x86_64.rpm && \
  yum -y install $APACHE_DS-x86_64.rpm openldap-clients

ENV APACHE_DS apacheds-2.0.0_M24

COPY run.sh /opt/$APACHE_DS/bin/

RUN ln -s /var/lib/$APACHE_DS /var/lib/apacheds && \
  mkdir -p /data/apacheds && \
  ln -s /var/lib/apacheds/default/partitions /data/apacheds/partitions && \
  ln -s /var/lib/apacheds/default/log /data/apacheds/log && \
  chown -R apacheds:apacheds /var/lib/apacheds/default/partitions && chown -R apacheds:apacheds /data/apacheds/partitions && \
  chown -R apacheds:apacheds /var/lib/apacheds/default/log && chown -R apacheds:apacheds /data/apacheds/log && \  
  chmod +x /opt/$APACHE_DS/bin/run.sh

COPY config.ldif /var/lib/apacheds/default/conf/


VOLUME /data/apacheds/partitions
VOLUME /data/apacheds/log

ENTRYPOINT /opt/$APACHE_DS/bin/run.sh
