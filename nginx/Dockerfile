FROM alpine:3.3
RUN apk add --no-cache nginx
COPY conf/nginx.conf /etc/nginx/
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
