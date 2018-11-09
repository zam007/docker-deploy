FROM harbor.tiejin.cn/closer/umscloud-base
MAINTAINER Brian Olsen "jolestar@gmail.com"

RUN mkdir -p /opt/sonatype-nexus /opt/sonatype-work-template /opt/sonatype-work
RUN wget -O /tmp/nexus-latest-bundle.tar.gz http://sonatype-download.global.ssl.fastly.net/nexus/oss/nexus-2.11.4-01-bundle.tar.gz
RUN tar xzvf /tmp/nexus-latest-bundle.tar.gz -C /opt/sonatype-nexus --strip-components=1
RUN useradd --user-group --system --home-dir /opt/sonatype-nexus nexus
RUN chown -R nexus:nexus /opt/sonatype-work-template /opt/sonatype-work /opt/sonatype-nexus
ENV NEXUS_WEBAPP_CONTEXT_PATH /nexus
ADD start_as_nexus.sh /opt/start_as_nexus.sh
ADD start_nexus.sh /opt/start_nexus.sh
RUN ln -s /opt/start_nexus.sh /opt/start.sh

#RUN yum -y install createrepo
#RUN yum -y install rpmbuild

CMD ["/opt/start_as_nexus.sh"]
VOLUME /opt/sonatype-work
EXPOSE 8081
