FROM ubuntu:22.04

WORKDIR /nachos

# Add i386 architecture support
RUN dpkg --add-architecture i386

# Update and install dependencies
RUN apt-get -y update && apt-get -y dist-upgrade

# Install dependencies
RUN apt-get -y update && apt-get install -y csh ed git build-essential gcc-multilib g++-multilib gdb gdb-multiarch

# Install tools
RUN apt-get -y update && apt-get install -y clangd bear clang-format

# Copy cross-compiler to /usr
COPY ./usr /usr