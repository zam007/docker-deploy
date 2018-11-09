FROM harbor.tiejin.cn/closer/umscloud-base
MAINTAINER tidezyc <tide.zyc@gmail.com>
RUN yum -y groupinstall "Development tools"
RUN \
  cd /tmp && \
  wget http://download.redis.io/redis-stable.tar.gz && \
  tar xvzf redis-stable.tar.gz && \
  cd redis-stable && \
  make && \
  make install && \
  cp -f src/redis-sentinel /usr/local/bin && \
  mkdir -p /etc/redis && \
  cp -f *.conf /etc/redis && \
  rm -rf /tmp/redis-stable*

COPY redis.conf /etc/redis/redis.conf
# ENV REDIS_MAXMEMORY 1024m
# ENV REDIS_MAXMEMORY_POLICY volatile-lru
# ENV REDIS_DIR /data
# ENV REDIS_LOGFILE /logs/redis.log
# Define mountable directories.
VOLUME ["/data"]
VOLUME ["/logs"]

# Define working directory.
WORKDIR /data

# Define default command.
#ENTRYPOINT ["redis-server", "--maxmemory 1024m", "--maxmemory-policy volatile-lru", "--dir /data", "--logfile /logs/redis.log", "--port 6379"]
ENTRYPOINT ["redis-server","/etc/redis/redis.conf"]

# Expose ports.
EXPOSE 6379
