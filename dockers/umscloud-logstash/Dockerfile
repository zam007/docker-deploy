FROM harbor.tiejin.cn/closer/umscloud-base
MAINTAINER meteor <a03021@gmail.com>

RUN \
  cd /tmp && \
  mkdir -p /apps &&\
  wget https://download.elastic.co/logstash/logstash/logstash-2.2.2.tar.gz && \
  tar xvzf logstash-2.2.2.tar.gz && \
  mv logstash-2.2.2  /apps/logstash && \
  mkdir -p /apps/logstash/config

COPY logstash.conf /apps/logstash/config/
# Define default command.

CMD /apps/logstash/bin/logstash -f /apps/logstash/config/

# Expose ports.
EXPOSE 1224
