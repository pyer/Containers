#!/bin/sh

export EMAIL='pierre.bazonnard@gmail.com'
export GANDI_API_KEY=50NAB5k0qRhrppOriAsnqRCD

echo "======================================="
echo "Let's Encrypt certificate"
echo ""

for domain in 'www.bazonnard.fr' 'api.bazonnard.fr'
do
        echo "======================================="
        echo "Generate certificate for $domain"
        echo "---------------------------------------"
        certbot certonly --manual \
            --force-renewal \
            --expand \
            --preferred-chain "ISRG Root X1" \
            --agree-tos \
            --manual-public-ip-logging-ok \
            --no-eff-email \
            --non-interactive \
            --preferred-challenges=dns \
            --manual-auth-hook authenticate.sh \
            --manual-cleanup-hook cleanup.sh \
            --email "pierre.bazonnard@logista.com" \
            -d "${domain}" \
            --server https://acme-v02.api.letsencrypt.org/directory
            "$@"
done
echo "======================================="
