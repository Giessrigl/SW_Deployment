FROM debian:jessie

RUN apt-get update && apt-get upgrade -y

RUN apt-get install systemd-sysv

RUN apt-get install apache2 -y

RUN apt-get install php5 php-pear php5-mysql php5-gd -y

RUN apt-get install wget -y
RUN apt-get install tar -y
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz

RUN apt-get install rsync -y
RUN rm -f /var/www/html/index.php
RUN rm -f /var/www/html/index.html
RUN rsync -a /wordpress/ /var/www/html/
RUN chown -R www-data:www-data /var/www/html

RUN rm -f /var/run/apache2/apache2.pid
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN service apache2 restart

EXPOSE 80

VOLUME /var/www/html

CMD apachectl -D FOREGROUND