SRCS         := $(shell find ./src -type f -name '*.go')
GO_CONTAINER := $(shell docker-compose ps -q go)

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
	docker cp $(GO_CONTAINER):/work/bin/main.handle sam/bin/main.handle

invoke: sam/bin/main.handle
	docker-compose run --rm lambda sam local invoke MyApp -e events/event.json --docker-volume-basedir $(PWD)/sam

go/fmt:
	docker-compose run --rm -v $(PWD)/src:/work/src go $(MAKE) fmt
