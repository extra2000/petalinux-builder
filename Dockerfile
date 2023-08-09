FROM docker.io/ubuntu:22.04 AS base

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
        locales \
        curl \
    && locale-gen en_US en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
    && apt install -y \
        gawk \
        xz-utils \
        net-tools \
        python3 \
        python3-pip \
        python3-pexpect \
        python3-git \
        python3-jinja2 \
        python3-subunit \
        pylint \
        less \
        texinfo \
        dos2unix \
        cpio \
        tmux \
        vim \
        sudo \
        git \
        git-lfs \
        chrpath \
        diffstat \
        lz4 \
        zstd \
        wget \
        unzip \
        socat \
        debianutils \
        iputils-ping \
        libegl1-mesa \
        mesa-common-dev \
        liblz4-tool \
        file \
    && useradd --create-home --shell /bin/bash builder \
    && usermod -aG sudo builder \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && rm -v /bin/sh \
    && ln --symbolic /bin/bash /bin/sh

USER builder

# Fix git's "error setting certificate verify locations"
RUN git config --global http.sslCAinfo "/etc/ssl/certs/ca-certificates.crt"

WORKDIR /home/builder
