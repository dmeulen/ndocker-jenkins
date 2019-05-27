include env_make

NS = theanimaldock
VERSION ?= latest

REPO = ndocker-jenkins
NAME = jenkins
INSTANCE = default

.PHONY: build

build:
	docker build \
		--rm \
		--compress \
		--tag $(NS)/$(REPO):$(VERSION) .

clean:
	docker rmi \
		--force \
		$(NS)/$(REPO):$(VERSION)

shell:
	docker run \
		-it \
		$(NS)/$(REPO) \
		sh

run:
	docker run \
		--rm \
		--name $(NAME)-$(INSTANCE) \
		$(PORTS) \
		$(VOLUMES) \
		$(ENV) \
		$(NS)/$(REPO):$(VERSION)

stop:
	docker stop \
		$(NAME)-$(INSTANCE)

tag:
	docker tag $(NS)/$(REPO):latest $(NS)/$(REPO):$(VERSION)

push:
	docker push \
		$(NS)/$(REPO):$(VERSION)

default: build

