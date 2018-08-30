FROM ubuntu:10.04
MAINTAINER camel

# install basic dependencies
COPY apt-key-1.txt /tmp/
COPY apt-key-2.txt /tmp/
RUN apt-key add /tmp/apt-key-1.txt
RUN apt-key add /tmp/apt-key-2.txt

RUN \
    echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/90forceyes;\
    sed -i -e "s/archive.ubuntu.com/old-releases.ubuntu.com/g" /etc/apt/sources.list; \
    echo "deb http://ppa.launchpad.net/git-core/ppa/ubuntu lucid main" > /etc/apt/sources.list.d/git-core-ppa-lucid.list; \
    apt-get update 


# install aosp dependencies

RUN apt-get install -y gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev ia32-libs x11proto-core-dev libx11-dev lib32readline5-dev lib32z-dev libgl1-mesa-dev g++-4.3-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc 

RUN apt-get install python-software-properties
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update
RUN apt-get install -y git

RUN apt-get install gcc-4.3; \
    apt-get install g++-4.3; \
    ln -f /usr/bin/gcc-4.3 /usr/bin/gcc; \
    ln -f /usr/bin/g++-4.3 /usr/bin/g++
 
# install jdk5
COPY jdk-1_5_0_22-linux-amd64.bin /tmp/
RUN \
   echo yes|sh /tmp/jdk-1_5_0_22-linux-amd64.bin ;\
   rm /tmp/jdk-1_5_0_22-linux-amd64.bin
ENV JAVA_HOME /jdk1.5.0_22
ENV PATH /jdk1.5.0_22/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r -g 1000 builduser && useradd -r -g builduser -u 1000 builduser
RUN mkdir -p /build \
 	&& chown -R builduser:builduser /build

WORKDIR /build
VOLUME /build
CMD ["/bin/bash"]

