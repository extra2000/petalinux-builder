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
        python3-gi \
        python3-virtualenv \
        libgtk-3-dev \
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
        zip \
        socat \
        debianutils \
        iputils-ping \
        libegl1-mesa \
        mesa-common-dev \
        liblz4-tool \
        file \
        iproute2 \
        pkg-config \
        libssl-dev \
        libacl1 \
        libsdl1.2-dev \
        build-essential \
        gcc \
        graphviz \
        libxtst6 \
        libxi6 \
        libtinfo5 \
        bc \
        xterm \
        autoconf \
        libtool \
        rsync \
        gcc-multilib \
        lsb-release \
        libncurses-dev \
    && useradd --create-home --shell /bin/bash builder \
    && usermod -aG sudo builder \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && rm -v /bin/sh \
    && ln --symbolic /bin/bash /bin/sh

USER builder

# Install rust and Cargo Bitbake
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y \
    && source $HOME/.cargo/env \
    && cargo install --locked cargo-bitbake \
    && rustup component add clippy

# Install JDK and related-tools via SDKMAN!
RUN curl -s "https://get.sdkman.io" | bash \
    && source /home/builder/.sdkman/bin/sdkman-init.sh \
    && sdk install java 21.0.2-graal \
    && sdk install gradle 8.6

# Fix git's "error setting certificate verify locations"
RUN git config --global http.sslCAinfo "/etc/ssl/certs/ca-certificates.crt"

# Auto source AMD Xilinx tools
RUN echo $' \n\
if test -f /tools/Xilinx/Vivado/2024.1/settings64.sh; then \n\
  source /tools/Xilinx/Vivado/2024.1/settings64.sh \n\
fi \n\

if test -f /tools/Xilinx/PetaLinux/2024.1/tool/settings.sh; then \n\
  source /tools/Xilinx/PetaLinux/2024.1/tool/settings.sh \n\
fi' >> /home/builder/.bashrc

WORKDIR /home/builder
