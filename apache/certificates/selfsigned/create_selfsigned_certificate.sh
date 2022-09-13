#!/bin/sh
# This script creates self signed certificate for the domain bazonnard.fr on an Apache server.
# Files ${CONFDIR}/bazonnard.fr.key and ${CONFDIR}/bazonnard.fr.crt are generated
# Configuration is in the file ${CONFDIR}/extra/httpd-ssl.conf :
#    SSLCertificateFile     "/usr/local/apache2/conf/bazonnard.fr.crt"
#    SSLCertificateKeyFile "/usr/local/apache2/conf/bazonnard.fr.key"

DOMAIN="bazonnard.fr"
COMMON_NAME="*.$DOMAIN"
SUBJECT="/C=CA/ST=None/L=NB/O=None/CN=$COMMON_NAME"
DAYS=93

CONFDIR=../../conf

# Create v3.ext file
echo "authorityKeyIdentifier=keyid,issuer" >v3.ext
echo "basicConstraints=CA:FALSE" >>v3.ext
echo "keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment" >>v3.ext
echo "subjectAltName = @alt_names" >>v3.ext
echo "" >>v3.ext
echo "[alt_names]" >>v3.ext
echo "DNS.1 = $COMMON_NAME" >>v3.ext

# Create root key
sudo openssl genrsa -out ${CONFDIR}/rootCA.key 2048
# Create root CA
sudo openssl req -x509 -new -nodes -key ${CONFDIR}/rootCA.key -sha256 -days $DAYS -out ${CONFDIR}/rootCA.pem -batch -config ./openssl.conf

# Create a new private key and the certificate
sudo openssl req -new -newkey rsa:2048 -sha256 -nodes -keyout ${CONFDIR}/bazonnard.fr.key -subj "$SUBJECT" -out ${CONFDIR}/bazonnard.fr.csr -batch -config ./openssl.conf
sudo openssl x509 -req -in ${CONFDIR}/bazonnard.fr.csr -CA ${CONFDIR}/rootCA.pem -CAkey ${CONFDIR}/rootCA.key -CAcreateserial -out ${CONFDIR}/bazonnard.fr.crt -days $DAYS -sha256 -extfile v3.ext

# Remove temporary files
rm -f v3.ext 
