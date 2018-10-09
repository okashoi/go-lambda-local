SRCS := $(shell find . -type f -name '*.go')

.PHONY: default build fmt vet golint lint

default: build

build: $(SRCS)
	GOOS=linux GOARCH=amd64 vgo build -v -ldflags '-s -w' -a -tags netgo -installsuffix netgo -o $(GOPATH)/bin/main.handle ./main.go

fmt:
	echo $(SRCS) | xargs -n 1 gofmt $(FLAGS)

vet:
	vgo vet ./...

golint:
	golint -min_confidence=0 -set_exit_status ./...

lint:
	@echo "## gofmt"
	@$(MAKE) fmt FLAGS="-l"
	@echo
	@echo "## go vet"
	@$(MAKE) vet
	@echo
	@echo "## golint"
	@$(MAKE) golint
