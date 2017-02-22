# For more info on the base images, see: https://hub.docker.com/_/golang/
# For the image contents, see: https://github.com/docker-library/golang/blob/master/1.8/alpine/Dockerfile
FROM golang:1.8-alpine
MAINTAINER Samuel Lampa, samuel.lampa@farmbio.uu.se

WORKDIR /scipipe-data

RUN apk add --update git
RUN go get github.com/stretchr/testify
RUN go get gopkg.in/urfave/cli.v1
RUN go get github.com/tools/godep
RUN go get k8s.io/client-go/...
RUN cd $GOPATH/src/k8s.io/client-go && \
    git checkout v2.0.0 && \
    godep restore ./...
RUN cd /scipipe-data
