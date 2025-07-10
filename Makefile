.PHONY: test
default:
	./hack/build.sh
image:
	./hack/build-image.sh
push:
	docker push quay.io/jacding/linuxptp-daemon:4.18
clean:
	./hack/cleanup.sh
fmt:
	./hack/gofmt.sh

test:
	go test ./... --tags=unittests -coverprofile=cover.out

lint:
	golangci-lint run
