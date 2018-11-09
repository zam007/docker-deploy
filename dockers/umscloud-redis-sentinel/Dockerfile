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
  sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf

#COPY sentinel.conf /etc/redis/sentinel.conf
#ENV REDIS_MAXMEMORY 1024m
#ENV REDIS_MAXMEMORY_POLICY volatile-lru
#ENV REDIS_DIR /data
#ENV REDIS_LOGFILE /logs/sentinel.log
# Define mountable directories.
VOLUME ["/data"]
VOLUME ["/logs"]

# Define working directory.
WORKDIR /data

# Define default command.
ENTRYPOINT ["redis-sentinel", "/etc/redis/sentinel.conf", "--maxmemory 1024m", "--maxmemory-policy volatile-lru", "--dir /data", "--logfile /logs/sentinel.log", "--port 26379"]

# Expose ports.
EXPOSE 26379
