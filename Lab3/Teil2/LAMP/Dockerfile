FROM debian:jessie

RUN apt-get update && apt-get upgrade -y

RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update

RUN apt-get install systemd-sysv

RUN apt-get install apache2 -y

RUN apt-get install php5 php-pear php5-mysql php5-gd -y

RUN service apache2 restart

RUN apt-get install wget -y
RUN apt-get install tar -y
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz

RUN apt-get install rsync -y
RUN apt-get install sudo -y
RUN rm -f /var/www/html/index.php
RUN rm -f /var/www/html/index.html
RUN rsync -a /wordpress/ /var/www/html/
RUN chown -R www-data:www-data /var/www/html

# RUN chmod -R 777 /var/www/html

RUN apt-get install sudo -y
RUN apt-get install sed -y

RUN sudo service apache2 restart

RUN rm -f /var/run/apache2/apache2.pid

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

VOLUME /var/www/html

CMD apachectl -D FOREGROUND