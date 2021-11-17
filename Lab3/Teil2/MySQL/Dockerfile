FROM debian:jessie

RUN apt-get update && apt-get upgrade -y

ENV MYSQL_ROOT_PASSWORD="1234"
ENV MYSQL_DATABASE="wpdatabase"

ENV MYSQL_USER="wpuser"
ENV MYSQL_USER_PW="1234"

RUN echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
RUN apt-get install mysql-server -y
 
RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

RUN service mysql restart && mysql --password=$MYSQL_ROOT_PASSWORD -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
RUN service mysql restart && mysql --password=$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE"
RUN service mysql restart && mysql --password=$MYSQL_ROOT_PASSWORD -e "CREATE USER $MYSQL_USER"
RUN service mysql restart && mysql --password=$MYSQL_ROOT_PASSWORD -e "SET PASSWORD FOR $MYSQL_USER=PASSWORD('$MYSQL_USER_PW')"
RUN service mysql restart && mysql --password=$MYSQL_ROOT_PASSWORD -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
RUN service mysql restart && mysql --password=$MYSQL_ROOT_PASSWORD -e "DELETE FROM mysql.user WHERE User=''"
RUN service mysql restart && mysql --password=$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO wpuser IDENTIFIED BY '$MYSQL_USER_PW'"
RUN service mysql restart && mysql --password=$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES"

RUN find /etc/mysql/ -type d -exec chmod 0755 {} \;
RUN find /etc/mysql/ -type f -exec chmod 0644 {} \;

VOLUME /var/lib/mysql

EXPOSE 3306 33060

CMD ["mysqld"]