FROM alpine:3.7
MAINTAINER Pierre Bazonnard (Pyer)

# Change TimeZone
RUN apk add --no-cache tzdata
RUN echo "Europe/Paris" >/etc/TZ
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
# Custom profile
COPY files/profile /etc/profile
# Set user
RUN addgroup -g 1000 nginx && \
    adduser -D -u 1000 -G nginx nginx

# Install nginx
RUN apk add --no-cache nginx
RUN mkdir -p /run/nginx
COPY files/default.conf /etc/nginx/conf.d/

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

