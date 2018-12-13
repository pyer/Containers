FROM alpine:3.7

MAINTAINER Pierre Bazonnard (Pyer)
RUN apk add --no-cache mysql-client
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
