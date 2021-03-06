# Dockerfile of latest Puppet server
FROM phusion/baseimage:0.9.18

ENV HOME /root
ENV LANG en_US.UTF-8
ENV TERM xterm
RUN locale-gen en_US.UTF-8

# Fixes Docker Automated Build problem
RUN ln -s -f /bin/true /usr/bin/chfn

# Install tools
RUN apt-get update -q 2 && DEBIAN_FRONTEND=noninteractive \
    apt-get upgrade -y > /dev/null && \
    apt-get install -y apt-transport-https ca-certificates >/dev/null

# Set time zone
RUN echo "Europe/Paris" >/etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# Configure bash
COPY files/bashrc /root/.bashrc

# Remove syslog-forwarder
RUN rm -rf /etc/service/syslog-forwarder

# Install Puppet master server
ADD https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb /tmp/
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/puppetlabs-release-pc1-trusty.deb && apt-get update && apt-get install -y puppetserver
RUN rm /tmp/puppetlabs-release-pc1-trusty.deb
RUN apt-get autoclean

# Configure Puppet server
COPY files/puppet.conf /etc/puppetlabs/puppet/
COPY files/puppetserver.conf /etc/puppetlabs/puppetserver/conf.d/

# Launch Puppet master as a service
RUN mkdir /etc/service/puppet
COPY files/puppet.run /etc/service/puppet/run
RUN ln -s /opt/puppetlabs/server/apps/puppetserver/bin/puppetserver /usr/bin/puppetserver

# Expose Puppet Master port
EXPOSE 8140

# use baseimage's init system
CMD ["/sbin/my_init"]
