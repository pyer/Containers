FROM certbot/certbot:latest

RUN apk update
RUN apk add curl
RUN rm -rf /var/cache/apk/*

COPY bin/authenticate.sh /usr/local/bin/
COPY bin/cleanup.sh      /usr/local/bin/
COPY entrypoint.sh /

VOLUME /etc/letsencrypt
ENTRYPOINT [ "/entrypoint.sh" ]
