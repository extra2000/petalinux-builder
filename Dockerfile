FROM docker.io/ubuntu:20.04 AS base

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical

RUN useradd --create-home --shell /bin/bash builder

RUN dpkg --add-architecture i386 && apt update
RUN apt update && apt install -y build-essential gawk xz-utils net-tools xterm autoconf libtool python3 less rsync texinfo zlib1g-dev gcc-multilib libncurses-dev zlib1g:i386 dos2unix expect bc tftpd locales libtinfo5 cpio xxd tmux

RUN locale-gen en_US.UTF-8 && update-locale

COPY ./accept-eula.sh /opt/
RUN dos2unix /opt/accept-eula.sh && chmod 755 /opt/accept-eula.sh

USER builder
COPY --chown=builder:builder ./installer/petalinux-v2021.2-final-installer.run /opt/installer/

WORKDIR /home/builder
RUN /opt/accept-eula.sh
RUN echo "source /home/builder/petalinux/settings.sh" >> /home/builder/.bashrc
