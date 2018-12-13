#!/bin/sh

echo 'MariaDB server'

if [ ! -d "/run/mysqld" ]; then
  mkdir -p /run/mysqld
  chown -R mysql:mysql /run/mysqld
fi

if [ ! -d /var/lib/mysql/mysql ]; then
  echo 'Initializing database'
  chown -R mysql:mysql /var/lib/mysql
  # init database
  mysql_install_db --user=mysql > /dev/null

  if [ -f /var/lib/mysql/bootstrap.sql ]; then
    echo 'Bootstrapping database'
    /usr/bin/mysqld --user=mysql --bootstrap --verbose </var/lib/mysql/bootstrap.sql
    rm /var/lib/mysql/bootstrap.sql
  fi
fi

echo "Waiting 5s"
sleep 5
echo "Starting"
exec /usr/bin/mysqld --user=mysql --console
