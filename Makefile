.PHONY: build build-debug run run-debug stop stop-debug

IMAGE_NAME := hello-app
DEBUG_IMAGE_NAME := hello-app-debug

build:
	docker build -t $(IMAGE_NAME) -f Dockerfile .

build-debug:
	docker build -t $(DEBUG_IMAGE_NAME) -f Dockerfile.debug .

run: build
	docker run -d --name $(IMAGE_NAME) -p 80:80 $(IMAGE_NAME)

run-debug: build-debug
	docker run -d --name $(DEBUG_IMAGE_NAME) -p 80:80 -p 4000:4000 $(DEBUG_IMAGE_NAME)

stop:
	docker stop $(IMAGE_NAME)
	docker rm $(IMAGE_NAME)

stop-debug:
	docker stop $(DEBUG_IMAGE_NAME)
	docker rm $(DEBUG_IMAGE_NAME)