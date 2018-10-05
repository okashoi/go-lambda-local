# based on https://github.com/cnadiminti/docker-aws-sam-local
FROM alpine:3.6

ENV VERSION=0.2.11

RUN apk update && \
    apk add --no-cache curl py-pip && \
    rm -rf /var/cache/apk/* && \
    curl -sSLO https://github.com/awslabs/aws-sam-local/releases/download/v${VERSION}/sam_${VERSION}_linux_386.tar.gz && \
    tar -C /usr/local/bin -zxvf /sam_${VERSION}_linux_386.tar.gz && \
    rm -f /sam_${VERSION}_linux_386.tar.gz && \
    # awscli for "sam package" and "sam deploy"
    pip install awscli && \
    apk del curl

WORKDIR /var/opt
