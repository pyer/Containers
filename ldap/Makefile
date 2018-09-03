.PHONY: build clean run shell start status stop help

IMAGE="pyer/ldap-alpine"
CONTAINER="ldap"


default: help

build:
	docker build --rm -t $(IMAGE) .

clean: stop
	docker rm -f $(CONTAINER); true

run: build clean
	docker run -d -p 389:389 -v /opt/ldap:/var/lib/openldap --name $(CONTAINER) $(IMAGE)

master:
	docker run -ti -p 389:389 -v /opt/ldap_master:/var/lib/openldap --name ldap_master $(IMAGE)

slave:
	docker run -ti -p 388:389 -v /opt/ldap_slave:/var/lib/openldap --name ldap_slave $(IMAGE)

shell:
	docker exec -ti $(CONTAINER) /bin/ash -l

start:
	docker start $(CONTAINER)

status:
	docker ps --filter name=$(CONTAINER)

stop:
	docker stop $(CONTAINER); true

help:
	@echo "Usage: make build|clean|run|shell|start|status|stop"
