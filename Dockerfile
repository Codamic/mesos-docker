FROM ubuntu:14.04
MAINTAINER Sameer Rahmani <lxsameer@gnu.org>

RUN apt-get update && \
    apt-get install -y tar wget git  openjdk-7-jdk \
                                     build-essential \
                                     python-dev \
                                     libcurl4-nss-dev \
                                     libsasl2-dev \
                                     libsasl2-modules \
                                     maven \
                                     libapr1-dev \
                                     libsvn-dev \
                                     readline-common

RUN cd /usr/src/ && \
    wget http://www.apache.org/dist/mesos/0.28.2/mesos-0.28.2.tar.gz && \
    tar -zxf mesos-0.28.2.tar.gz

RUN cd /usr/src/mesos-0.28.2 && \
    mkdir build && \
    cd build && \
    ../configure  && \
     make -j 6 && \
     make install

EXPOSE 5050