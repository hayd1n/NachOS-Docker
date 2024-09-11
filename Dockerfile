FROM ubuntu:22.04

WORKDIR /nachos

# Add i386 architecture support
RUN dpkg --add-architecture i386

# Update and install dependencies
RUN apt-get update; apt-get dist-upgrade -y

# Install dependencies
RUN apt-get install -y csh ed git build-essential gcc-multilib g++-multilib gdb gdb-multiarch

# Copy cross-compiler to /usr
COPY ./usr /usr
