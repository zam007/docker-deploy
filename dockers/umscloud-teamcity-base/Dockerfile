FROM harbor.tiejin.cn/closer/umscloud-base
MAINTAINER jolestar <jolestar@gmail.com>

ENV TEAM_CITY_INSTALL_DIR /apps
RUN mkdir /apps
RUN yum install -y unzip
COPY gradle-2.3-all.zip /tmp/
RUN \
  cd /tmp && \
  unzip gradle-2.3-all.zip && \
  mv gradle-2.3 $TEAM_CITY_INSTALL_DIR/gradle && \
  rm gradle-2.3-all.zip

COPY apache-maven-3.3.1-bin.tar.gz /tmp/
RUN \
  cd /tmp && \
  tar -xvzf apache-maven-3.3.1-bin.tar.gz  && \
  mv apache-maven-3.3.1 $TEAM_CITY_INSTALL_DIR/maven && \
  rm apache-maven-3.3.1-bin.tar.gz

ENV PATH $PATH:$TEAM_CITY_INSTALL_DIR/maven/bin:$TEAM_CITY_INSTALL_DIR/gradle/bin


VOLUME ["/root/.m2"]
