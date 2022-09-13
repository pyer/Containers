#!/bin/bash
# This script creates Let's Encrypt certificate for the domain bazonnard.fr on an Apache server.

IMAGE=pyer/letsencrypt
CONTAINER=letsencrypt

mkdir -p certs
# Clean up previous certificates
sudo rm -rf certs/*
docker build -t "$IMAGE" .
docker run -ti --rm -e "TZ=Europe/Paris" -v "$PWD/certs:/etc/letsencrypt:rw" --name="$CONTAINER" "$IMAGE"

# Set Apache configuration
cd ..
sudo cp letsencrypt/certs/live/www.bazonnard.fr/privkey.pem   ../../conf/bazonnard.fr.key
sudo cp letsencrypt/certs/live/www.bazonnard.fr/fullchain.pem ../../conf/bazonnard.fr.crt

