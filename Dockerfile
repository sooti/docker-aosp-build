FROM ubuntu:19.04
MAINTAINER sooti

ENV USER root

# install dependencies
RUN apt-get -o Acquire::ForceIPv4=true update && \
    apt-get -o Acquire::ForceIPv4=true install -y openjdk-8-jdk \
                                                  android-tools-adb \ 
                                                  git-core \ 
                                                  gnupg \
                                                  flex \
                                                  bison \
                                                  gperf \
                                                  build-essential \
                                                  zip \
                                                  curl \
                                                  zlib1g-dev \
                                                  gcc-multilib \
                                                  g++-multilib \
                                                  libc6-dev-i386 \
                                                  lib32ncurses5-dev \
                                                  x11proto-core-dev \
                                                  libx11-dev \
                                                  lib32z-dev \
                                                  libgl1-mesa-dev \
                                                  libxml2-utils \
                                                  xsltproc \
                                                  unzip \
                                                  python \
                                                  rsync \
                                                  bc \
                                                  imagemagick \
                                                  lib32readline-dev \
                                                  liblz4-tool \
                                                  libncurses5-dev \
                                                  libsdl1.2-dev \
                                                  libssl-dev \
                                                  libwxgtk3.0-dev \
                                                  libxml2 \
                                                  lzop \
                                                  pngcrush \
                                                  schedtool \
                                                  squashfs-tools \
                                                  yasm \
                                                  nano \
                                                  wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
VOLUME /build

CMD ["/bin/bash"]
