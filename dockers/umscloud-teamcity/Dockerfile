FROM harbor.tiejin.cn/closer/umscloud-teamcity-base
MAINTAINER jolestar <jolestar@gmail.com>

ENV TEAMCITY_INSTALL_DIR /apps

COPY TeamCity-9.1.1.tar.gz /tmp/
RUN \
  cd /tmp && \
  tar -xvzf TeamCity-9.1.1.tar.gz && \
  mv TeamCity $TEAM_CITY_INSTALL_DIR/ && \
  rm TeamCity-9.1.1.tar.gz

ENV TEAMCITY_DATA_PATH "/root/.BuildServer"

EXPOSE 8111

CMD $TEAM_CITY_INSTALL_DIR/TeamCity/bin/teamcity-server.sh run
