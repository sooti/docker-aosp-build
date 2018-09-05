FROM ubuntu:18.04
MAINTAINER camel

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
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
VOLUME /build

COPY aosp-build.sh /usr/local/bin/aosp-build.sh
RUN chmod 777 /usr/local/bin/aosp-build.sh

# ENTRYPOINT ["/usr/local/bin/aosp-build.sh"]

CMD ["/bin/bash"]
