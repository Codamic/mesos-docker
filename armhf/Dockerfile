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

ENV VERSION="1.4.1" \
    BASE_URL="http://www-eu.apache.org/dist/mesos" \
    CONFIG_FLAGS="" \
    MAKE_FLAGS="-j 3"

ENV PACKAGE="mesos-$VERSION".tar.gz
ENV PACKAGE_URL="$BASE_URL/$VERSION/$PACKAGE"
ENV KEYS_URL="$BASE_URL"/KEYS

RUN ln -sv /usr/include/locale.h /usr/include/xlocale.h
RUN mkdir -p /tmp/mesos
WORKDIR /tmp/mesos
# RUN curl -L "$KEYS_URL" -o KEYS
# RUN gpg --import KEYS
#RUN curl -L "$PACKAGE_URL".asc -o "$PACKAGE".asc
RUN echo "$PACKAGE_URL"
RUN curl -L "$PACKAGE_URL" -o "$PACKAGE"
#RUN gpg --verify "$PACKAGE".asc "$PACKAGE"
RUN tar xf "$PACKAGE"
WORKDIR /tmp/mesos/mesos-"$VERSION"
RUN ./configure $CONFIG_FLAGS
RUN make $MAKE_FLAGS
