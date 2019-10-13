FROM ubuntu:bionic
ENV DEBIAN_FRONTEND=noninteractive

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install software-properties-common tzdata language-pack-ja \
    && add-apt-repository --yes ppa:rpardini/adoptopenjdk \
    && apt-get update \
    && apt-get install -y adoptopenjdk-11-jdk-hotspot-installer/bionic \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    &&  update-locale LANG=ja_JP.UTF-8 \
    && apt-get -y remove tzdata \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=
ENV JAVA_HOME=/usr/lib/jvm/adoptopenjdk-11-jdk-hotspot
