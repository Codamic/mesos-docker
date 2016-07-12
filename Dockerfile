FROM ubuntu:14.04
MAINTAINER Sameer Rahmani <lxsameer@gnu.org>

RUN apt-get update && \
    apt-get install -y tar wget git -y openjdk-7-jdk \
                                       build-essential \
                                       python-dev \
                                       libcurl4-nss-dev \
                                       libsasl2-dev \
                                       libsasl2-modules \
                                       maven \
                                       libapr1-dev \
                                       libsvn-dev
WORKDIR /
EXPOSE 5050