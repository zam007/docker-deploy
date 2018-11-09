FROM harbor.tiejin.cn/closer/umscloud-teamcity-base
MAINTAINER jolestar <jolestar@gmail.com>


RUN yum -y install docker-io

# Expose the default TeamCity Agent port
EXPOSE 9090

# Add agent runner which sets its config before running
ADD agent.sh $TEAM_CITY_INSTALL_DIR/TeamCity/bin/agent.sh
RUN chmod u+x $TEAM_CITY_INSTALL_DIR/TeamCity/bin/agent.sh

ENV OWNER_ADDRESS 127.0.0.1
ENV OWNER_PORT 9090
ENV DOCKER_HOST tcp://$OWNER_ADDRESS:4243/
ENV TEAMCITY_MASTER_HOST $OWNER_ADDRESS:8181


# Ensure the hostname can be resolved and start the TeamCity Agent
CMD $TEAM_CITY_INSTALL_DIR/TeamCity/bin/agent.sh $OWNER_ADDRESS $OWNER_PORT
