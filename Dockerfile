FROM docker.io/ubuntu:22.04 AS base

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical

RUN dpkg --add-architecture i386 \
    && apt update \
    && apt upgrade -y \
    && apt install -y \
        locales \
        software-properties-common \
        curl \
    && add-apt-repository universe \
    && locale-gen en_US en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
    && apt install -y \
        build-essential \
        gawk \
        xz-utils \
        net-tools \
        xterm \
        autoconf \
        libtool \
        python3 \
        less \
        rsync \
        texinfo \
        zlib1g-dev \
        gcc-multilib \
        libncurses-dev \
        zlib1g:i386 \
        dos2unix \
        expect \
        bc \
        tftpd \
        libtinfo5 \
        cpio \
        xxd \
        tmux \
        device-tree-compiler \
        vim \
        sudo \
        git \
    && useradd --create-home --shell /bin/bash builder \
    && usermod -aG sudo builder \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && rm -v /bin/sh \
    && ln --symbolic /bin/bash /bin/sh

USER builder

# Install ROS2 Humble
RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null \
    && sudo apt update && sudo apt install -y \
        ros-humble-desktop \
        ros-dev-tools \
        ros-humble-rmw-cyclonedds-cpp

# Install Gazebo
RUN curl -sSL http://get.gazebosim.org | sh \
    && sudo apt update && sudo apt install -y ros-humble-gazebo-ros-pkgs

# Fix git's "error setting certificate verify locations"
RUN git config --global http.sslCAinfo "/etc/ssl/certs/ca-certificates.crt"

# Missing packages for yocto bitbake
RUN sudo apt update && sudo apt install -y \
    chrpath \
    diffstat \
    lz4 \
    zstd

# Install dependencies for AMD KRS
RUN sudo apt update && sudo apt install -y \
    libssl-dev \
    git \
    git-lfs \
    wget \
    ocl-icd-* \
    opencl-headers \
    python3-vcstool \
    python3-colcon-common-extensions \
    python3-colcon-mixin \
    kpartx \
    u-boot-tools \
    pv \
    libboost-all-dev

WORKDIR /home/builder
