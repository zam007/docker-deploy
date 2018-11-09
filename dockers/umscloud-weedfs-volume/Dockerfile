FROM docker.umscloud.com/umscloud-weedfs
MAINTAINER jolestar <jolestar@gmail.com>

ENV PUBLIC_IP 127.0.0.1
ENV VOLUME_MAX 100
ENV MASTER_SERVER 127.0.0.1

# Define default command.
CMD /apps/weedfs/weed volume -publicIp=$PUBLIC_IP -port=9090 -dir=/data/ -max=$VOLUME_MAX -mserver=$MASTER_SERVER
# Expose ports.
EXPOSE 9090

