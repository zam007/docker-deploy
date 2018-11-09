FROM corbinu/docker-nginx-php
MAINTAINER tidezyc <tide.zyc@gmail.com>

ENV PMA_HOST            127.0.0.1
ENV PMA_PORT			3306
ENV PMA_USERNAME        umscloud_pma
ENV PMA_PASSWORD        umscloud_pma

RUN apt-get update
RUN apt-get install -y mysql-client

ENV PHPMYADMIN_VERSION 4.3.8
ENV MAX_UPLOAD "50M"

RUN wget http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2
RUN tar -xvjf /phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2 -C /
RUN rm /phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.bz2
RUN rm -r /www
RUN mv /phpMyAdmin-${PHPMYADMIN_VERSION}-english /www

ADD sources/config.inc.php /
ADD sources/phpmyadmin-start /usr/local/bin/
ADD sources/phpmyadmin-firstrun /usr/local/bin/

RUN chmod +x /usr/local/bin/phpmyadmin-start
RUN chmod +x /usr/local/bin/phpmyadmin-firstrun

RUN sed -i "s/http {/http {\n        client_max_body_size $MAX_UPLOAD;/" /etc/nginx/nginx.conf
RUN sed -i "s/upload_max_filesize = 2M/upload_max_filesize = $MAX_UPLOAD/" /etc/php5/fpm/php.ini
RUN sed -i "s/post_max_size = 8M/post_max_size = $MAX_UPLOAD/" /etc/php5/fpm/php.ini

EXPOSE 80

CMD phpmyadmin-start
