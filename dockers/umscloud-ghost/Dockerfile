FROM harbor.tiejin.cn/closer/umscloud-nginx-nodejs
MAINTAINER jolestar <jolestar@umscloud.com>

RUN yum install -y unzip
RUN \
  cd /tmp && \
  wget http://dl.ghostchina.com/Ghost-0.6.3-zh.zip &&\
  mkdir -p /apps &&\
  unzip Ghost-0.6.3-zh.zip -d /tmp/ghost &&\
  rm -rf /apps/nodejs &&\
  cp -r /tmp/ghost /apps/nodejs &&\
  rm Ghost-0.6.3-zh.zip 

RUN \
  cd /apps/nodejs &&\
  npm install --production

COPY conf/blog.conf /etc/nginx/conf.d/blog.conf
COPY conf/config.js /apps/nodejs/config.js

