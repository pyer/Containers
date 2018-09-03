#!/bin/sh
# docker entrypoint script

# When not limiting the open file descritors limit, the memory consumption of
# slapd is absurdly high. See https://github.com/docker/docker/issues/8231
ulimit -n 8192

# create database if needed
[ -d /var/lib/openldap/data ] || mkdir -p /var/lib/openldap/data
[ -f /var/lib/openldap/data/DB_CONFIG ] || cp /etc/openldap/DB_CONFIG /var/lib/openldap/data/
# select replication role
[ -f /var/lib/openldap/MASTER ] && cp /etc/openldap/slapd_master.conf /etc/openldap/slapd.conf
[ -f /var/lib/openldap/SLAVE  ] && cp /etc/openldap/slapd_slave.conf  /etc/openldap/slapd.conf

# add any ldif files to ldap database
for ldif in /var/lib/openldap/*.ldif; do
  slapadd -c -l $ldif
  rm $ldif
done

# starts LDAP
slapd -d none -h "ldap:///"

# run command passed to docker run
exec "$@"
