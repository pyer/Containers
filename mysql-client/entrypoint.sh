#!/bin/sh

# waiting for network connexion
sleep 2
# running mysql client
exec /usr/bin/mysql $*
