FROM debian:jessie
MAINTAINER Sameer Rahmani <lxsameer@gnu.org>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    echo "deb http://repos.mesosphere.io/debian jessie main" | \
    tee /etc/apt/sources.list.d/mesosphere.list && \
    apt-get -y update && \
    apt-get -y install mesos && \
    apt-get -y clean

WORKDIR /
EXPOSE 5050