How To Create a Self-Signed SSL Certificate for Apache
======================================================

> sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout conf/selfsigned.key -out conf/selfsigned.crt
Generating a RSA private key
..................+++++
..+++++
writing new private key to 'conf/selfsigned.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:FR
State or Province Name (full name) [Some-State]:France
Locality Name (eg, city) []:Gagny
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Bazonnard
Organizational Unit Name (eg, section) []:Pierre
Common Name (e.g. server FQDN or YOUR name) []:bazonnard.fr
Email Address []:pierre.bazonnard@gmail.com


Issue
=====

Le problème est que l'autorité de certification n'est pas reconnue !
NET::ERR_CERT_AUTHORITY_INVALID


How to display the PEM content
==============================

> openssl x509 -in bazonnard.fr.pem -noout -text


Solution
========

Add bazonnard.fr.pem in Chrome authorities certificates.

NET::ERR_CERT_COMMON_NAME_INVALID
Subject: bazonnard.fr
Issuer: bazonnard.fr
Expires on: Sep 9, 2023
Current date: Sep 9, 2022

!!!
