FROM ubuntu:14.04
MAINTAINER camel

# install dependencies
RUN apt-get update
RUN apt-get install -y bc bison bsdmainutils build-essential curl \
    flex g++-multilib gcc-multilib git gnupg gperf lib32ncurses5-dev \
    lib32readline-gplv2-dev lib32z1-dev libesd0-dev libncurses5-dev \
    libsdl1.2-dev libwxgtk2.8-dev libxml2-utils lzop \
    openjdk-7-jdk \
    pngcrush schedtool xsltproc zip zlib1g-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV USER root

WORKDIR /build
VOLUME /build
CMD ["/bin/bash"]

