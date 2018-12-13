FROM alpine:3.7

MAINTAINER Pierre Bazonnard (Pyer)

# Change TimeZone
RUN apk add --no-cache tzdata
RUN echo "Europe/Paris" >/etc/TZ
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
# Customize
COPY files/profile /etc/profile

# Set user
RUN addgroup -g 1000 mysql && \
    adduser -D -u 1000 -G mysql mysql

# Installing packages MariaDB
RUN apk add --no-cache mysql mysql-client
COPY files/my.cnf /etc/mysql/
# Copy of the MySQL startup script
COPY files/entrypoint.sh /

# Creating the persistent volume
VOLUME [ "/var/lib/mysql" ]
EXPOSE 3306

ENTRYPOINT [ "/entrypoint.sh" ]
