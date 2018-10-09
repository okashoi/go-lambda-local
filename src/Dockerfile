FROM golang:1.11-alpine

ARG GOPATH
ARG IMPORT_PATH

RUN apk update && \
    apk add --no-cache git make gcc musl-dev && \
    rm -rf /var/cache/apk/* && \
    go get -u golang.org/x/vgo && \
    go get -u github.com/golang/lint/golint

WORKDIR ${GOPATH}/src/${IMPORT_PATH}
COPY ./ ${GOPATH}/src/${IMPORT_PATH}

RUN make
