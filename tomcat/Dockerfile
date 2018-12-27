FROM tomcat:8.5-jre8-alpine
MAINTAINER Pierre Bazonnard (Pyer)

# Update
RUN apk update
# Change TimeZone
RUN apk add --no-cache tzdata
RUN echo "Europe/Paris" >/etc/TZ
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
# Custom profile
COPY files/profile /etc/profile
# Set user
RUN addgroup -g 1000 tomcat && \
    adduser -D -h /home/tomcat -u 1000 -G tomcat tomcat
RUN chown -R tomcat:tomcat /usr/local/tomcat/*
# Environment
ENV CHARSET=UTF-8
# Entry point
ADD files/entrypoint.sh /

RUN apk add --no-cache postgresql-client
VOLUME [ "/home" ]
EXPOSE 8080
USER tomcat
ENTRYPOINT ["/entrypoint.sh"]
