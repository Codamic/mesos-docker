# Reqs:
# apt install qemu qemu-user-static binfmt-support
# # update-binfmts --display | grep -i aarch
# qemu-aarch64 (enabled):
# interpreter = /usr/bin/qemu-aarch64-static
# https://github.com/vektorcloud/mesos/blob/master/Dockerfile
FROM arm64v8/openjdk:8-alpine3.7

# QEMU ARM emulator
COPY qemu-aarch64-static /usr/bin/qemu-aarch64-static

#RUN /usr/bin/apt update
RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" |tee >> /etc/apk/repositories
RUN echo "@edge.testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" |tee >> /etc/apk/repositories
RUN apk update
RUN apk add apr-util alpine-sdk python2 python2-dev libcurl maven libsasl py2-pip
RUN apk add apr \
    apr-dev \
    autoconf \
    automake \
    boost \
    boost-dev \
    curl \
    curl-dev \
    cyrus-sasl-crammd5 \
    cyrus-sasl-dev \
    file \
    fts \
    fts-dev \
    g++ \
    git \
    glog@edge.testing \
    glog-dev@edge.testing \
    gpgme \
    libtool \
    linux-headers \
    make \
    openjdk8 \
    openssl \
    patch \
    python \
    python-dev \
    subversion \
    subversion-dev \
    zlib \
    zlib-dev

RUN pip install six virtualenv
RUN git clone https://git-wip-us.apache.org/repos/asf/mesos.git /usr/src/mesos
WORKDIR /usr/src/mesos
RUN git checkout 1.4.1
ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

RUN ./bootstrap
RUN ./configure
RUN make || true
RUN for i in `find . -iname "config.guess"`; do cp /usr/share/automake-1.15/config.guess $i -v; done

RUN make -j 3
RUN make install
