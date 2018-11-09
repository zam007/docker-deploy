FROM docker.umscloud.com/umscloud-weedfs:1.1
MAINTAINER jolestar <jolestar@gmail.com>

ENV DEFAULT_REPLICATION 000 

# Define default command.
CMD /apps/weedfs/weed master -port=9333 -defaultReplication=$DEFAULT_REPLICATION -mdir="/data"

# Expose ports.
EXPOSE 9333

