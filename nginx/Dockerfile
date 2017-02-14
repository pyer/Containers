FROM alpine:3.3
MAINTAINER Pierre Bazonnard (Pyer)
# Change TimeZone
RUN apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
# Customize
COPY conf/profile /etc/profile
# And clean
RUN rm -rf /etc/profile.d /usr/local
# Install nginx
RUN apk add --no-cache nginx
COPY conf/nginx.conf /etc/nginx/
#
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
