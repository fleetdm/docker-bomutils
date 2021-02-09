FROM ubuntu:latest AS build

RUN apt-get update && apt-get install -y build-essential file curl

RUN curl -L https://github.com/hogliux/bomutils/archive/0.2.tar.gz > bomutils.tar.gz && \
    echo "fb1f4ae37045eaa034ddd921ef6e16fb961e95f0364e5d76c9867bc8b92eb8a4  bomutils.tar.gz" | sha256sum --check && \
    tar -xzf bomutils.tar.gz && \
    cd bomutils-0.2 && \
    LDFLAGS=-static make

FROM alpine

MAINTAINER Fleet Developers <engineering@fleetdm.com>

COPY --from=build bomutils-0.2/build/bin/* /usr/local/bin/ 

USER 1000
