#! /usr/bin/make -f

include makefile.config

.PHONY: build debug default pull push remove run shell start status stop

default: build

build:
	docker build --force-rm=true --tag=$(registry)/$(image):$(tag) $(ARGS) .

debug:
	mkdir --parents $(persistent)
	docker run \
		--hostname=$(name) \
		--name=$(name) \
		--tty=true \
		--volume=$(persistent):/persistent/:ro \
		$(runargs) \
		$(registry)/$(image):$(tag) \
		$(ARGS)

pull:
	docker pull $(ARGS) $(registry)/$(image):$(tag)

push:
	docker push $(ARGS) $(registry)/$(image):$(tag)

remove:
	docker rm --volumes=true $(ARGS) $(name)

run:
	mkdir --parents $(persistent)
	docker run \
		--detach=true \
		--hostname=$(name) \
		--name=$(name) \
		--tty=true \
		--volume=$(persistent):/persistent/:ro \
		$(runargs) \
		$(registry)/$(image):$(tag) \
		$(ARGS)

shell:
#	docker exec --interactive=true --tty=true $(name) /bin/login -f root $(ARGS)
	docker exec --interactive=true --tty=true $(name) /bin/bash $(ARGS)

start:
	docker start $(ARGS) $(name)

status:
	docker ps $(ARGS) --all=true --filter=name=$(name)

stop:
	docker stop $(ARGS) $(name)

