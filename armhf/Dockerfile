FROM arm32v7/debian:stable-slim

# QEMU ARM emulator
COPY bin/qas /usr/bin/qas

RUN ["/usr/bin/qas", "/bin/cp", "/bin/sh", "/bin/sh.real"]

# Checkout sh.fake.go file for details
COPY sh.fake /bin/sh.fake

# Restor the real shell and run everything using QEMU
RUN ["/bin/sh.fake"]

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk \
                       tar wget git \
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

# Restore fake shell
RUN ["/bin/sh.fake"]
