# Beschreibung der Aufgabe
Setzen Sie die Software „Wordpress“ mit externer MySQL DB in 2 Containern auf. 
Diese Aufgabe besteht aus 2 Teilen. In den jeweiligen Teilen wird die gleiche Software mittels Container zu Verfügung gestellt, 
wobei die Container in Teil 2 selbst zu erstellen sind.

## Teil 1) 
Erstellung eines Docker-Compose Files welche Wordpress und MySQL Images verwendet um eine Wordpress Container Infrastruktur aufzusetzen.

## Teil 2)
Erstellung eigener Images auf Basis von Debian 8 für einen Wordpress Container. 

-) Apache + PHP + Wordpress
-) MySQL

Beide Images benötigen persistente Volumes. Wordpress um die hochgeladenen Dateien und die Config zu verwalten, 
MySQL um die Datenbank persistent zu halten.  Die beiden Container sollen mittels TCP/IP kommunizieren können. Beachten sie dafür die entsprechenden Ports.

# Teil 1

Literally this: https://docs.docker.com/samples/wordpress/
There is nothing more to say.

# Teil 2
## Apache-PHP-Wordpress Image
### Debian:Jessie

https://unix.stackexchange.com/questions/508724/failed-to-fetch-jessie-backports-repository

### Apache
[Guide](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-debian)
> sudo apt install nano
> sudo apt install ufw

- got an unkown D-Bus error after: sudo systemctl restart apache2?
tried following:
sudo apt install systemd-sysv - command still not working
instead of systemctl command I used: service apache2 restart - worked

for later use of testing network connection:
> ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
my ip is: 172.17.0.2

if you need to change listening ports:
sudo nano /etc/apache2/ports.conf

### PHP
[Guide](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-debian)
apt-get install php5 php-pear php5-mysql

for newer apache server versions:
try
nano /var/www/html/info.php
and then add

<?php
phpinfo();
?>

### Wordpress
[How To Install LAMP & WordPress on Debian 8](https://www.youtube.com/watch?v=ZZzSxiFo8sM&ab_channel=LinuxLab)
just used the wordpress part.

problem with chmod access changing?
https://github.com/moby/moby/issues/7281

## MySQL Image
also use Debian:Jessie like in the other image

[Guide](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-debian)
sudo apt-get install mysql-server
mysql_secure_installation

follow Wordpress [Guide](https://www.youtube.com/watch?v=ZZzSxiFo8sM&ab_channel=LinuxLab) for setting up database in mysql.



## Networking
[Guide](https://www.digitalocean.com/community/questions/how-to-ping-docker-container-from-another-container-by-name)
aquire docker container names:
> docker ps

> docker network create {NetworkName}
for all containers to connect to the network:
> docker network connect {NetworkName} {ContainerName}

test the connection:
> docker exec -ti {ContainerName1} ping {ContainerName2}