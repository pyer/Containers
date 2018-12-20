FROM alpine:3.7
MAINTAINER Pierre Bazonnard (Pyer)
# Change TimeZone
RUN apk add --no-cache tzdata
RUN echo "Europe/Paris" >/etc/TZ
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
# Clean
RUN rm -f  /linuxrc /sbin/init
RUN rm -rf /etc/inittab /etc/conf.d
RUN rm -rf /usr/local
RUN rm -rf /etc/profile.d
# Customize
COPY files/profile /etc/profile
COPY files/cron /etc/init.d/
#COPY init/busybox /sbin/busybox
ADD files/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["/bin/busybox", "ash", "-l"]
