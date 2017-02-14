FROM alpine:3.3
MAINTAINER Pierre Bazonnard (Pyer)
# Change TimeZone
RUN apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
# Customize
COPY files/profile /etc/profile
# And clean
RUN rm -rf /etc/profile.d /usr/local
#
ENTRYPOINT ["/bin/ash", "-l"]
