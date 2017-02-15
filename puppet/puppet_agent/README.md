This "puppet_agent" container is just a sample to test puppet master or puppet server.
This is not a Puppet documentation.

See https://docs.puppet.com/puppet/4.6/reference


### Requirements

Puppet master or server container is running.

Puppet manifests and modules are in /opt/puppet/code.


### Getting started

1. Build this container with `./build` script

2. Start it with `./run` script

3. Update /etc/hosts file with the Puppet master IP address

4. Request a certificate to Puppet master: `puppet agent -t`

4. On Puppet master, sign the agent certificate request: `puppet cert sign puppetagent.home`

5. Puppet is now available in this puppet_agent container, try `puppet agent -v`


### Using Puppet

Important files are in "/opt/puppet/code" host directory.

This directory is shared with Puppet master container and can be changed in "run" scripts.

