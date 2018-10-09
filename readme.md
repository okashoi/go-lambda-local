[![CircleCI](https://circleci.com/gh/okashoi/go-lambda-local.svg?style=svg)](https://circleci.com/gh/okashoi/go-lambda-local)

## Requirements

* Docker 1.13.0+
* Docker-Compose

## Usage

### Initial setup

```
cp .env.example .env
vim .env             # edit environment variables
```

### Start environment

```
make up
```

### Build

Build from `src/main.go`.

```
make
```

### Execute Lambda function

Invoke the event `sam/events/event.json`.

```
make invoke
```

If the source code is modified, built implicitly before executing.

### Format Golang source codes (go fmt)

Format source codes under the direcotry `src`.

```
make go/fmt
```

### Lint (gofmt, vet, golint)

```
make go/lint
```

### Run test

```
make go/test
```

### Shutdown environment

```
make down
```
