# Containers
My Docker containers

# Tips and tricks

### How to get a console from a running container ?
`docker attach container`

Close the console with `ctrl-P ctrl-Q` without shutdown the container.

`ctrl-C` closes te console and shutdowns the container.

### How to get a bash process into a running container ?
`docker exec -ti container /bin/bash`

`ctrl-C` interrupts the bash process and lets the container running.
