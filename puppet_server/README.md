This container is Puppet Server running on the Java Virtual Machine (JVM) and providing the same services as the classic Puppet master application.

Puppet master on Webrick is deprecated. The other recommended way to run the Puppet master is a Rack server.


### Getting started

0. Provide your own id_rsa.pub file in files or remove "install ssh" in Dockerfile

1. Build this container with `./build` script

2. Start it with `./run` script

3. Attach a console: `docker exec -ti puppetmaster bash`

4. List agents waiting for a certificate: `puppet cert list`

5. Sign certificate requests: `puppet cert sign --all`

6. Puppet master is ready to answer to agent requests.


### Notes

1. This Puppet server container is called "puppetmaster" as my "puppet_master" container. This allows switching "puppet_master" and "puppet_server" containers without impact on agents.

2. sshd daemon is opional and is not required by Puppet server.


### ssh connection

1. Retrieve the Puppet server IP address: `docker inspect puppetmaster`

2. Connect: `ssh root@<IPaddress>`

What else ?
