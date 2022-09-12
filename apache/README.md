How To Create a Self-Signed SSL Certificate for Apache
======================================================

> ./create_selfsigned_certificate.sh

Then add conf/rootCA.pem in Chrome authorities certificates.


How to display the PEM content
==============================

> openssl x509 -in conf/rootCA.pem -noout -text


How to display the CRT content
==============================

> openssl x509 -in conf/selfsigned.crt -noout -text


