FROM docker.umscloud.com/umscloud-base

RUN mkdir -p /apps/weedfs

COPY weed /apps/weedfs/

VOLUME ["/data"]
VOLUME ["/logs"]

WORKDIR /apps/weedfs

EXPOSE 8080
EXPOSE 9333

ENTRYPOINT ["/apps/weedfs/weed"]
