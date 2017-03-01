FROM alpine:3.3
MAINTAINER Pierre Bazonnard (Pyer)
RUN apk add --no-cache php-fpm php-pgsql
# Keep default php.ini
# COPY conf/php.ini      /etc/php/php.ini
COPY conf/php-fpm.conf /etc/php/php-fpm.conf
EXPOSE 9000
ENTRYPOINT ["php-fpm","-F"]
