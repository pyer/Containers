FROM alpine:3.7
MAINTAINER Pierre Bazonnard (Pyer)
#
RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache "libpq@edge<11.1" "postgresql-client@edge<11.1" "postgresql@edge<11.1"
RUN apk add --no-cache tzdata
# Change TimeZone
RUN echo "Europe/Paris" >/etc/TZ
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN rm -rf /var/cache/apk/*
# Environment
ENV CHARSET UTF-8
ENV LANG en_US.utf8
ENV PGDATA /home
RUN chown postgres:postgres /home
# Entry point
ADD files/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
USER postgres
