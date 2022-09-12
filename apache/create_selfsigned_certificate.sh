#!/bin/sh
# This script creates self signed certificate for the domain bazonnard.fr on an Apache server.
# Files conf/selfsigned.key and conf/selfsigned.crt are generated
# Configuration is in the file conf/extra/httpd-ssl.conf :
#    SSLCertificateFile     "/usr/local/apache2/conf/selfsigned.crt"
#    SSLCertificateKeyFile "/usr/local/apache2/conf/selfsigned.key"

DOMAIN="bazonnard.fr"
COMMON_NAME="*.$DOMAIN"
SUBJECT="/C=CA/ST=None/L=NB/O=None/CN=$COMMON_NAME"
DAYS=93

# Create v3.ext file
echo "authorityKeyIdentifier=keyid,issuer" >v3.ext
echo "basicConstraints=CA:FALSE" >>v3.ext
echo "keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment" >>v3.ext
echo "subjectAltName = @alt_names" >>v3.ext
echo "" >>v3.ext
echo "[alt_names]" >>v3.ext
echo "DNS.1 = $COMMON_NAME" >>v3.ext

# Create root key
sudo openssl genrsa -out conf/rootCA.key 2048
# Create root CA
sudo openssl req -x509 -new -nodes -key conf/rootCA.key -sha256 -days $DAYS -out conf/rootCA.pem -batch -config ./openssl.conf

# Create a new private key and the certificate
sudo openssl req -new -newkey rsa:2048 -sha256 -nodes -keyout conf/selfsigned.key -subj "$SUBJECT" -out conf/selfsigned.csr -batch -config ./openssl.conf
sudo openssl x509 -req -in conf/selfsigned.csr -CA conf/rootCA.pem -CAkey conf/rootCA.key -CAcreateserial -out conf/selfsigned.crt -days $DAYS -sha256 -extfile v3.ext

# Remove temporary files
rm -f v3.ext 
