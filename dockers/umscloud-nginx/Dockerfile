FROM harbor.tiejin.cn/closer/umscloud-base
MAINTAINER jolestar <jolestar@gmail.com> 

ADD etc/nginx.repo /etc/yum.repos.d/nginx.repo

# Install base stuff.
RUN yum -y install \
  nginx \

# Clean up YUM when done.
RUN yum clean all

RUN mkdir /srv/www

#RUN sed -ri 's/user www www;/user nginx nginx;\n\n# Run Nginx in the foreground for Docker.\ndaemon off;/g' /etc/nginx/nginx.conf

VOLUME ["/srv/www", "/var/log"]

EXPOSE 80

#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY etc/nginx.conf /etc/nginx/nginx.conf
#CMD ["nginx", "-g", "daemon off;"]
RUN rm /etc/nginx/conf.d/*
CMD nginx
