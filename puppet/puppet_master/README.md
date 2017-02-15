This container is a simple Puppet master server using Webrick library.

### Warning

The WEBrick Puppet master server is deprecated and will be removed in a future Puppet release.


### Getting started

1. Build this container with `./build` script

2. Start it with `./run` script

3. Attach a console: `docker exec -ti puppetmaster bash`

4. List agents waiting for a certificate: `puppet cert list`

5. Sign certificate requests: `puppet cert sign --all`

6. Puppet master is ready to answer to agent requests.

