SRCS         := $(shell find ./src -type f -name '*.go')
GO_CONTAINER := $(shell docker-compose ps -q go)
GO_PATH      := /go
IMPORT_PATH  := github.com/okashoi/go-lambda-local

.PHONY: default up down invoke go/*

default: sam/bin/main.handle

.env:
	cp .env.example .env

up: .env
	docker-compose up -d --build

down:
	docker-compose down

sam/bin/main.handle: $(SRCS)
	docker-compose up -d --build go
	docker cp $(GO_CONTAINER):$(GO_PATH)/bin/main.handle sam/bin/main.handle
	$(MAKE) src/go.mod

src/go.mod: sam/bin/main.handle
	docker cp $(GO_CONTAINER):$(GO_PATH)/src/$(IMPORT_PATH)/go.mod src/go.mod
	docker cp $(GO_CONTAINER):$(GO_PATH)/src/$(IMPORT_PATH)/go.sum src/go.sum

invoke: sam/bin/main.handle
	docker-compose run --rm lambda sam local invoke MyApp -e events/event.json --docker-volume-basedir $(PWD)/sam

go/fmt:
	docker-compose run --rm -v $(PWD)/src:$(GO_PATH)/src/$(IMPORT_PATH) go $(MAKE) fmt
