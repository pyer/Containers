FROM pyer/alpine:3.3

RUN deluser postgres
# 116 is my local postgres UID and 125 is postgres GID
#RUN addgroup -g 125 postgres
#RUN adduser -D -u 116 -g "PostgreSQL administrator" -h /home -s /bin/ash postgres
RUN adduser -D -u 1000 -g "PostgreSQL administrator" -h /home -s /bin/ash postgres

COPY files/gosu /usr/bin/
RUN chmod +x /usr/bin/gosu
RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && apk update
#RUN apk add "libpq@edge<9.7" "postgresql-client@edge<9.7" "postgresql@edge<9.7" "postgresql-contrib@edge<9.7"
RUN apk add "libpq@edge<9.7" "postgresql-client@edge<9.7" "postgresql@edge<9.7"
RUN rm -rf /var/cache/apk/*

ENV LANG en_US.utf8
ENV PGDATA /home
VOLUME /home

COPY files/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 5433
CMD ["postgres"]
