# Nginx Alpine container

## Build

The 'build' script builds and runs a minimal Nginx HTTP server on port 8080.


## Usage

In this example, site is located in /opt/site directory and configurations files are in /opt/nginx directory.
Internally, the site is in /home/nginx directory.

**Build :** `docker build --rm -t pyer/nginx .`
**Run   :** `docker run -d -p 8080:80 -v /opt/site:/home/nginx -v /opt/nginx:/etc/nginx/conf.d --name nginx pyer/nginx`
**Shell :** `docker exec -ti nginx ash -l`

## Versions

Alpine : `3.7`   
Nginx  : `1.12.2`

