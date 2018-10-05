FROM golang:1.11-alpine

RUN apk update && \
    apk add --no-cache git make && \
    rm -rf /var/cache/apk/* && \
    go get -u github.com/aws/aws-lambda-go/lambda

WORKDIR /work/src
COPY ./ /work/src

RUN make
