# MySQL client Alpine container

## Usage

**Build :** `docker build --rm -t pyer/mysql-client .`
**Run   :** `docker run -ti --rm pyer/mysql-client <args>`

This container is deleted after exit (--rm)

Create network before run: `docker create network sql-net`


## Versions

Alpine : `3.7`   
MySQL : `mariaDB-10.1.32-r1`

## Example

Connecting to "mysql" server through "sql-net" network with arguments "--host=mysql --port=3306 --user=wp --password=wp wordpress"

`docker run -ti --rm --network sql-net pyer/mysql-client --host=mysql --port=3306 --user=wp --password=wp wordpress`
