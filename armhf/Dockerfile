# Reqs:
# apt install qemu qemu-user-static binfmt-support
# # update-binfmts --display | grep -i aarch
# qemu-aarch64 (enabled):
# interpreter = /usr/bin/qemu-aarch64-static
FROM arm64v8/debian:stable-slim

# QEMU ARM emulator
COPY /usr/bin/qemu-aarch64-static /usr/bin/qemu-aarch64-static

RUN /usr/bin/apt update
RUN /usr/bin/apt install -y tar wget git \
                       build-essential \
                       python-dev \
                       python-six \
                       python-virtualenv \
                       libcurl4-nss-dev \
                       libsasl2-dev \
                       libsasl2-modules \
                       maven \
                       libapr1-dev \
                       libsvn-dev \
                       zlib1g-dev

#RUN /usr/bin/apt install -y openjdk-8-jdk
