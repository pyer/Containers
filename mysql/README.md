# MySQL Alpine container


## Usage

**Build :** `docker build --rm -t pyer/mysql .`
**Run   :** `docker run -d -v /opt/mysql:/var/lib/mysql --publish 3306:3306 --network sql-net --name mysql pyer/mysql`
**Shell :** `docker exec -ti mysql ash -l`

**MySQL dump   :** `docker exec -ti mysql /usr/bin/mysqldump --user=root --password=root --add-drop-database --single-transaction database_name >database_name.dump`

The argument "--password" avoids that "enter password:" to be the first line of database\_name.dump
A database dump can be done  with shell access inside the container.
If the dump file is in /var/lib/mysql directory, it will be available outside the container in /opt/mysql

Create network before run: `docker create network sql-net`


## Versions

Alpine : `3.7`   
MySQL : `mariaDB-10.1.32-r1`


## Bootstrap

When the mysql container is launched for the first time and before the service mysqld starts, a bootstrap step can be included.
First time means the directory /opt/mysql is empty.
Bootstrap step is defined by /opt/mysql/bootstrap.sql file.

The file /opt/mysql/bootstrap.sql is run once and deleted after bootstrap step. 
See files/entrypoint.sh and files/bootstrap.sql


## Persistent data

All databases are persistent after the first start, even if the container is rebuild.

