FROM alpine:3.3
MAINTAINER Pierre Bazonnard (Pyer)
# Change TimeZone
RUN apk add --no-cache tzdata
RUN echo "Europe/Paris" >/etc/TZ
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
# Customize
COPY files/profile /etc/profile
COPY files/aliases.sh /etc/profile.d/
RUN rm -rf /usr/local
RUN deluser postgres
ENV PATH=/usr/sbin:/usr/bin:/sbin:/bin
CMD ["/bin/busybox", "ash", "-l"]
