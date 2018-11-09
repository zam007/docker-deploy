FROM docker.umscloud.com/umscloud-weedfs
MAINTAINER jolestar <jolestar@gmail.com>

ENV PUBLIC_IP 127.0.0.1

# Define default command.
CMD /apps/weedfs/weed server -master.port=9333 -volume.port=9090 -dir="/data" -publicIp=$PUBLIC_IP 2>&1 >/logs/weedfs.log

# Expose ports.
EXPOSE 9333
EXPOSE 9090

