FROM arm32v7/debian:stable-slim
COPY qas /usr/bin/qas

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