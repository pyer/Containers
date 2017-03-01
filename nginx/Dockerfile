FROM pyer/alpine:3.3
MAINTAINER Pierre Bazonnard (Pyer)
# Install nginx
RUN apk add --no-cache nginx
COPY conf/nginx.conf /etc/nginx/
#
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
