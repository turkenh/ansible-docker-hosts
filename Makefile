USER=turkenh

.DEFAULT_GOAL := all

build:
	docker build -t $(USER)/${IMAGE}-ansible-docker-host -f ${IMAGE}/Dockerfile .

push:
	docker push $(USER)/${IMAGE}-ansible-docker-host

build_and_push: build push

all:
	IMAGE=ubuntu-1404 $(MAKE) build_and_push
	IMAGE=ubuntu-1604 $(MAKE) build_and_push
