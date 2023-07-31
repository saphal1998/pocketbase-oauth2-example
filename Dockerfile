# This Dockerfile is for Pocketbase
FROM alpine:latest

ARG PB_VERSION=0.17.0

RUN apk add --no-cache \
    unzip \ 
    openssh

ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

EXPOSE 8080

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080", "--debug"]``