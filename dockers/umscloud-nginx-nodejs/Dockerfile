FROM harbor.tiejin.cn/closer/umscloud-nginx
MAINTAINER jolestar <jolestar@gmail.com>
RUN  wget https://npm.taobao.org/mirrors/node/latest-v8.x/node-v8.10.0-linux-x64.tar.xz
RUN  tar -xvf node-v8.10.0-linux-x64.tar.xz -C /usr/share
RUN  rm -rf /usr/bin/node
RUN  rm -rf /usr/bin/npm
RUN ln -s /usr/share/node-v8.10.0-linux-x64/bin/node /usr/bin/node
RUN ln -s /usr/share/node-v8.10.0-linux-x64/bin/npm /usr/bin/npm
RUN yum -y install supervisor logrotate

ADD nodejs-app  /apps/nodejs
RUN cd /apps/nodejs && npm install

ADD etc/supervisord.conf        /etc/supervisord.conf
ADD etc/supervisord.nginx.conf     /etc/supervisord.d/
ADD etc/supervisord.nodejs.conf     /etc/supervisord.d/

EXPOSE 80 3000

CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf" ]