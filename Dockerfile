FROM ubuntu:16.04
MAINTAINER camel

ENV USER root

# install dependencies
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk android-tools-adb bc bison build-essential curl flex g++-multilib gcc-multilib gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc yasm zip zlib1g-dev


WORKDIR /build
VOLUME /build
CMD ["/bin/bash"]

