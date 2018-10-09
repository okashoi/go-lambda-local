FROM golang:1.11-alpine

ARG GOPATH
ARG IMPORT_PATH

RUN apk update && \
    apk add --no-cache git make && \
    rm -rf /var/cache/apk/* && \
    go get -u github.com/aws/aws-lambda-go/lambda

WORKDIR ${GOPATH}/src/${IMPORT_PATH}
COPY ./ ${GOPATH}/src/${IMPORT_PATH}

RUN make
