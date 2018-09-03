FROM alpine:3.7
MAINTAINER Pierre Bazonnard
# Change TimeZone
RUN apk add --no-cache tzdata
RUN echo "Europe/Paris" >/etc/TZ
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
# Customize
COPY files/profile /etc/profile

# Application
RUN mkdir -p /run/openldap /var/lib/openldap/data
RUN apk add --no-cache openldap openldap-back-hdb openldap-overlay-syncprov

COPY config/slapd*.conf /etc/openldap/
COPY config/DB_CONFIG  /etc/openldap/
COPY files/entrypoint.sh /

EXPOSE 389

VOLUME ["/var/lib/openldap"]

ENTRYPOINT ["/entrypoint.sh"]
