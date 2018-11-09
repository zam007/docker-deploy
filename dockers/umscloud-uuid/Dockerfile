FROM docker.umscloud.com/umscloud-base
MAINTAINER xupiao <xhbpiao@gmail.com>

RUN mkdir -p /apps/uuid

COPY redis-uuid /apps/uuid/

ENTRYPOINT ["/apps/uuid/redis-uuid","-p 6000"]

EXPOSE 6000
