# Beschreibung der Aufgabe
Setzen Sie die Software „Wordpress“ mit externer MySQL DB in 2 Containern auf. 
Diese Aufgabe besteht aus 2 Teilen. In den jeweiligen Teilen wird die gleiche Software mittels Container zur Verfügung gestellt, 
wobei die Container in Teil 2 selbst zu erstellen sind.

## Teil 1) 
Erstellung eines Docker-Compose Files welche Wordpress und MySQL Images verwendet um eine Wordpress Container Infrastruktur aufzusetzen.

## Teil 2)
Erstellung eigener Images auf Basis von Debian:jessie für eine Wordpress Container Infrastruktur. 

* Apache + PHP + Wordpress
* MySQL

Beide Images benötigen persistente Volumes. Wordpress um die hochgeladenen Dateien und die Config zu verwalten, 
MySQL um die Datenbank persistent zu halten.  Die beiden Container sollen mittels TCP/IP kommunizieren können. Beachten sie dafür die entsprechenden Ports.

# Teil 1
How to deploy:
* Use a shell (cmd / powershell / git bash / etc)
* Navigate to the path of the docker-compose file
* Use the following command:
> docker-compose up -d

This command builds the images and deploys them in a container.

# Teil 2
## Apache-PHP-Wordpress Image
### Debian:Jessie
To use debian:jessie, the Dockerfile needs the following line:
> FROM debian:jessie

### Apache
[How To Install Linux, Apache, MySQL, PHP (LAMP) stack on Debian](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-debian)

> apt-get install apache2 -y

### PHP
[How To Install Linux, Apache, MySQL, PHP (LAMP) stack on Debian](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-debian)

> apt-get install php5 php-pear php5-mysql php5-gd -y

### Wordpress
[How To Install LAMP & WordPress on Debian 8](https://www.youtube.com/watch?v=ZZzSxiFo8sM&ab_channel=LinuxLab)

just used the wordpress part.

### How to build the image:
* Open a shell
* Navigate to Dockerfile path
* Use the following command:
> docker build .
* (optional) Give it a tag:
> docker build -t tag .

## MySQL Image
also use Debian:jessie like in the other image

[How To Install Linux, Apache, MySQL, PHP (LAMP) stack on Debian](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-debian)

Use this Wordpress [Guide](https://www.youtube.com/watch?v=ZZzSxiFo8sM&ab_channel=LinuxLab) for setting up database in mysql.

Before installing the mysql-server package, there is the need to define a root password beforehand, or use the "expect" package to define the answer to setting a password after downloading the mysql-server package.
After the mysql-server installation, there are two things to consider:
* switching the [bind-address](https://stackoverflow.com/questions/39314086/what-does-it-mean-to-bind-a-socket-to-any-address-other-than-localhost/39314221)
[Guide](https://serverfault.com/questions/139323/how-to-bind-mysql-server-to-more-than-one-ip-address)
setting to 0.0.0.0 is effective but not efficient for production ;)  )
* changing the access rights to the mysql files for mysql itself
this would result in mysql not being able to read, write or create files and therefore not being able to connect wordpress with it.

### Now you are able to:
* set up a database / user/ user-password  for your wordpress.
* use the mysql_secure_installation -> in form of mysql commands

### And last but not least:
* Set a Volume
* Expose the needed ports
* Start mysql in form of keeping the container running

### How to build the image:
* Open a shell
* Navigate to Dockerfile path
* Use the following command:
> docker build .
* (optional) Give it a tag:
> docker build -t tag .

## Networking
[Container pinging](https://www.digitalocean.com/community/questions/how-to-ping-docker-container-from-another-container-by-name)

Create a docker network.

Connect both containers to the network.

This can also be done in the docker-compose file (see [this](https://docs.docker.com/compose/networking/) ).

## Deployment
See Teil1

# Problems
TOO many to count
Some lines in the files are probably residues from those problems and their testing and I did not remove them after the deployment worked because of fear that something will break again.

Some of the problems:
* Had multiple problems with access rights. 
* Server request fails. 
* Docker container stopping immediatly after start.
* Apache process already started error. Immediatly upon container start.
* Failed D-Bus connection from trying systemctl commands.
* Finding the correct files to change.
* Not getting useful error messages.
* Not finding "useful" content for the errors to the assigned task.
