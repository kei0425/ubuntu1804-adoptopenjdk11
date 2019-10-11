FROM ubuntu:bionic

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install software-properties-common \
    && add-apt-repository --yes ppa:rpardini/adoptopenjdk \
    && apt-get update \
    && apt-get install -y adoptopenjdk-11-jdk-hotspot-installer/bionic \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
