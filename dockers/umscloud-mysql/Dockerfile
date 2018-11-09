FROM harbor.tiejin.cn/closer/umscloud-base
MAINTAINER jolestar <jolestar@gmail.com>
RUN yum -y install mysql-community-common-5.6.20
RUN yum -y install mysql-community-libs-5.6.20
#RUN yum -y install mysql-community-libs-compat-5.6.20
RUN yum -y install mysql-community-client-5.6.20
RUN yum -y install mysql-community-server-5.6.20
#COPY supervisord.conf /etc/supervisord.conf

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Add MySQL configuration
#RUN rm /etc/my.cnf
ADD my.cnf /etc/my.cnf

# Add MySQL scripts
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD import_sql.sh /import_sql.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Exposed ENV
ENV MYSQL_USER admin
ENV MYSQL_PASS **Random**
ENV SERVER_ID 1

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql","/var/log/mysql","/var/lib/mysql"]

EXPOSE 3306
CMD ["/run.sh"]
#CMD ["/usr/bin/supervisord"]
#CMD ["/bin/bash"]
#CMD ["/usr/sbin/sshd", "-D"]
#ENTRYPOINT ["/usr/sbin/sshd", "-D"]
