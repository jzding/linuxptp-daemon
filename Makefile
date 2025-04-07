IMAGE_NAME ?= linuxptp-daemon-image
IMAGE_TAG_BASE ?= ghcr.io/k8snetworkplumbingwg/$(IMAGE_NAME)
VERSION ?=latest
IMG ?= $(IMAGE_TAG_BASE):$(VERSION)
CONTAINER_TOOL ?=docker
IMG=quay.io/jacding/linuxptp-daemon:4.18

.PHONY: test
default:
	./hack/build.sh
image:
	./hack/build-image.sh
clean:
	./hack/cleanup.sh
fmt:
	./hack/gofmt.sh

test:
	go test ./... --tags=unittests -coverprofile=cover.out

lint:
	golangci-lint run
