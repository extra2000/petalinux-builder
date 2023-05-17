FROM docker.io/ubuntu:20.04 AS base

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
    && locale-gen en_US.UTF-8 \
    && update-locale \
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

# --- ROS2 installation begins ---

USER builder

RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null \
    && sudo apt update && sudo apt install -y \
        python3-flake8-docstrings \
        python3-pip \
        python3-pytest-cov \
        ros-dev-tools \
    && sudo python3 -m pip install -U \
        flake8-blind-except \
        flake8-builtins \
        flake8-class-newline \
        flake8-comprehensions \
        flake8-deprecated \
        flake8-import-order \
        flake8-quotes \
        "pytest>=5.3" \
        pytest-repeat \
        pytest-rerunfailures

ENV ROS_PYTHON_VERSION=3
ENV ROS_DISTRO=humble

RUN mkdir -pv /home/builder/ros2_humble/src
COPY ./installer/ros2-humble.repos /home/builder/ros2_humble/ros2-humble.repos

WORKDIR /home/builder/ros2_humble
RUN vcs import --input ./ros2-humble.repos src \
    && sudo rosdep init \
    && rosdep fix-permissions \
    && rosdep update \
    && rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers" \
    && colcon build --symlink-install

# --- ROS2 installation ends ---

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

# Install Gazebo
RUN curl -sSL http://get.gazebosim.org | sh

RUN mkdir -pv /home/builder/gazebo_ros_pkgs/src
WORKDIR /home/builder/gazebo_ros_pkgs

COPY ./installer/gazebo_ros_pkgs.repos /home/builder/gazebo_ros_pkgs/gazebo_ros_pkgs.repos

RUN vcs import --input gazebo_ros_pkgs.repos src \
    && /bin/bash -c "\
        source /home/builder/ros2_humble/install/setup.bash \
        && rosdep update \
        && rosdep install --from-paths src --ignore-src -r -y \
        && colcon build --symlink-install \
"

WORKDIR /home/builder
