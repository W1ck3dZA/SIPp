#!/bin/bash

# SIPp Version
SIPP_VERSION="3.7.3"

# Update and install dependencies
echo "Updating system and installing dependencies..."
apt-get update
apt-get install -y \
    build-essential \
    libpcap-dev \
    libssl-dev \
    wget \
    git \
    cmake \
    libgsl-dev \
    libsctp-dev \
    libncurses-dev \
    libnet1-dev \
    lksctp-tools \
    autoconf \
    automake \
    libtool \
    pkg-config

# Download SIPp
echo "Downloading SIPp v$SIPP_VERSION..."
wget https://github.com/SIPp/sipp/releases/download/v$SIPP_VERSION/sipp-$SIPP_VERSION.tar.gz
wget https://github.com/W1ck3dZA/SIPp.git

# Extract the downloaded file
echo "Extracting SIPp v$SIPP_VERSION..."
tar -xvzf sipp-$SIPP_VERSION.tar.gz
cd sipp-$SIPP_VERSION

# Build SIPp using CMake, enabling necessary features.
echo "Building SIPp with GSL, PCAP, SSL, SCTP, and ncurses support"
cmake . -DUSE_GSL=1 -DUSE_PCAP=1 -DUSE_SSL=1 -DUSE_SCTP=1
make

# Install SIPp
echo "Installing SIPp..."
make install

# Clean up
cd ..
rm -rf sipp-$SIPP_VERSION.tar.gz sipp-$SIPP_VERSION

# Creating Required Folders
mkdir /root/sipp
mkdir /root/sipp/pcap
mkdir /root/sipp/wav
mkdir /root/sipp/logs
mkdir /root/sipp/scenario

# Check installation
echo "SIPp installed. Version:"
sipp -v

