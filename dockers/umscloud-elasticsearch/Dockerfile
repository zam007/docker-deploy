FROM harbor.tiejin.cn/closer/umscloud-base
MAINTAINER xupiao <xhbpiao@gmail.com>

RUN \
  cd /tmp && \
  mkdir -p /apps &&\
  mkdir -p /data/elasticsearch/ &&\
  wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-2.2.0.tar.gz && \
  tar xvzf elasticsearch-2.2.0.tar.gz
RUN  cd /tmp/elasticsearch-2.2.0 &&\
  bin/plugin install mobz/elasticsearch-head &&\
  bin/plugin install license &&\
  bin/plugin install marvel-agent &&\
  bin/plugin install mapper-attachments &&\
  bin/plugin install discovery-multicast &&\
  cd ../ && \
  mv elasticsearch-2.2.0  /apps/elasticsearch

COPY elasticsearch.yml /apps/elasticsearch/config/
# Define default command.

ENTRYPOINT ["/apps/elasticsearch/bin/elasticsearch","-Des.insecure.allow.root=true"]

# Expose ports.
EXPOSE 9200
EXPOSE 9300
