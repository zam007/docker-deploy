FROM harbor.tiejin.cn/closer/umscloud-base
MAINTAINER jolestar <jolestar@gmail.com> 


# Install base stuff.
RUN yum -y install \
  node \
  npm \
  gcc gcc-c++ make flex bison gperf ruby \
  openssl-devel freetype-devel fontconfig-devel libicu-devel sqlite-devel \
  libpng-devel libjpeg-devel 

RUN cd /tmp && \
git clone git://github.com/ariya/phantomjs.git && \
cd phantomjs  && \
git checkout 2.0 && \
./build.sh --confirm  

# Clean up YUM when done.
RUN yum clean all
#RUN rm -rf /tmp/*

RUN mkdir /apps && \
cd /apps && \
git clone https://github.com/fzaninotto/screenshot-as-a-service.git 
RUN  cd /apps/screenshot-as-a-service && npm install 


EXPOSE 3000

WORKDIR /apps/screenshot-as-a-service
CMD node app 
