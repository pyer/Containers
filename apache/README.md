How to create a Let's Encrypt SSL certificate for Apache
========================================================

```
> cd certificates/letsencrypt
>  ./create_letsencrypt_certificate.sh
```


How to create a self-signed SSL certificate for Apache
======================================================

```
> cd certificates/selfsigned
> ./create_selfsigned_certificate.sh
```

Then add conf/rootCA.pem in Chrome authorities certificates.

Or in another browser.


How to display the PEM content
==============================

> openssl x509 -in conf/rootCA.pem -noout -text


How to display the CRT content
==============================

> openssl x509 -in conf/bazonnard.fr.crt -noout -text


