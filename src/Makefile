SRCS := $(shell find . -type f -name '*.go')

.PHONY: default build fmt

default: build

build: $(SRCS)
	GOOS=linux GOARCH=amd64 go build -v -ldflags '-s -w' -a -tags netgo -installsuffix netgo -o /work/bin/main.handle main.go

fmt:
	echo $(SRCS) | xargs -n 1 go fmt
