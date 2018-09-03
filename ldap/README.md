# LDAP Alpine container

The Lightweight Directory Access Protocol (LDAP) is an open, vendor-neutral,
industry standard application protocol for accessing and maintaining
distributed directory information services over an Internet Protocol (IP) network.

This image is based on Alpine Linux and OpenLDAP.

Forked from `https://github.com/gitphill/ldap-alpine.git` but deeply modified.


## Usage

`make help` shows available commands.

Every command is defined in Makefile.

External files are in `/opt/ldap`.


## Customisation

Configuration is defined in config/slapd.conf

Container name and external directory are defined in Makefile


## Initialization

Create `/opt/ldap` directory.

Copy ldif files to `/opt/ldap/` and the container will load and delete them during the next restart.


# Running

See `make run` and `files/docker-ldap.service`


## Database

Database is filled with `/opt/ldap/*.ldif` files.

LDAP database is empty is no ldif file is present.

LDAP database is in `/opt/ldap/data` directory. Database is persistent.


## Logging Levels

| NAME | DESCRIPTION |
| :--- | :---------- |
| any | enable all debugging (warning! lots of messages will be output) |
| trace | trace function calls |
| packets | debug packet handling |
| args | heavy trace debugging |
| conns | connection management |
| BER | print out packets sent and received |
| filter | search filter processing |
| config | configuration processing |
| ACL | access control list processing |
| stats | stats log connections/operations/results |
| stats2 | stats log entries sent |
| shell | print communication with shell backends |
| parse | print entry parsing debugging |
| sync | syncrepl consumer processing |
| none | only messages that get logged whatever log level is set |

Logging level is defined in `entrypoint.sh`

Run Docker image with -ti option instead of -d will display logging informations.


## Transport Layer Security

Encrypted LDAPS protocol is not implemented in this container.


## Replication

Containers are ready to operate in master/slave refreshAndPersist mode.

Container starts in master mode if `/opt/ldap/MASTER` file is present.

Container starts in slave mode if `/opt/ldap/SLAVE` file is present.

IP address of master node is defined in `conf/slapd_slave.conf`

