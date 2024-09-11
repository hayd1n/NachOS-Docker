# NTUST NachOS 4.0 Docker

**This is a fork of [wynn1212/NachOS](https://github.com/wynn1212/NachOS) with Docker support**

> ⚠️ This project only support x86_64 architecture machine.

# Table of Contents

- [Prerequisite](#Prerequisite)
  - [Install Docker](#Install-Docker)
  - [Download Project](#Download-Project)
  - [Run Docker Image](#Run-Docker-Image)
- [Start a Shell in the Docker Container](#Start-a-Shell-in-the-Docker-Container)
- [Building NachOS](#Building-NachOS)
- [Testing NachOS](#Testing-NachOS)
- [Make Usage](#Make-Usage)
- [NachOS Usage](#NachOS-Usage)
- [Debug Flag](#Debug-Flag)
- [Adding User Program](#Adding-User-Program)
- [References](#References)

# Prerequisite

### Install Docker

Install [Docker Engine](https://docs.docker.com/engine/install/) and [Compose Plugin](https://docs.docker.com/compose/install/linux/)

### Download Project

Clone the project repository

```shell
git clone https://github.com/hayd1n/NachOS-Docker
```

### Run Docker Image

Navigate to the `NachOS` directory.
Start the Docker container in the background.

```shell
cd NachOS-Docker
docker compose up -d
```

# Start a Shell in the Docker Container

```shell
docker exec -it nachos-docker-nachos-1 /bin/bash
```

# Building NachOS

Enter the shell in the container first, then run `make` to build NachOS

```shell
make
```

**Note 1:** Whenever you make modifications to the source code, it is essential to rebuild the entire NachOS system.

**Note 2:** If your modifications are limited to the test directory, you can simply execute `make` within the test directory to build your program. However, if you have made changes to system calls or other core components, it is still necessary to rebuild the complete NachOS system.

# Testing NachOS

After a successful build, you should find the `nachos` executable in the `NachOS/code/userprog/` directory and your `test1` program in the `NachOS/code/test/` directory.

To run `test1` in NachOS, execute the following command:

```shell
./userprog/nachos -e ./test/test1
```

_Please note that you should be inside the `NachOS/code` directory. Otherwise, you should specify the actual location accordingly._

If you see this output, it indicates that you have successfully run `test1` in NachOS.

```
root@1a57f92ee0ca:/nachos# ./userprog/nachos -e ./test/test1
Total threads number is 1
Thread ./test/test1 is executing.
Print integer:9
Print integer:8
Print integer:7
Print integer:6
return value:0
No threads ready or runnable, and no pending interrupts.
Assuming the program completed.
Machine halting!

Ticks: total 200, idle 66, system 40, user 94
Disk I/O: reads 0, writes 0
Console I/O: reads 0, writes 0
Paging: faults 0
Network I/O: packets received 0, sent 0
```

# Make Usage

See [documents/Make_Usage.md](documents/Make_Usage.md)

# NachOS Usage

See [documents/NachOS_Usage.md](documents/NachOS_Usage.md)

# Debug Flag

See [documents/Debug_Flag.md](documents/Debug_Flag.md)

# Adding User Program

See [documents/Adding_User_Program.md](documents/Adding_User_Program.md)

# References

- https://github.com/wynn1212/NachOS - NTUST modified NachOS 4.0 source code and documents.
- https://homes.cs.washington.edu/~tom/nachos/ - Original NachOS 4.0 source code and documents.
- [GitHub - connlabtw/NachOS2020](https://github.com/connlabtw/NachOS2020) - This repository originated as a fork and includes the `PrintInt()` system call implementation.
- https://blog.csdn.net/Aloneingchild/article/details/115339992 - A guide that provides a solution for building NachOS on 64-bit Linux systems.
- [GitHub - Yan-Hau/NachOS](https://github.com/Yan-Hau/NachOS/tree/master#readme) - Another solution for building NachOS on 64-bit Linux systems. This repository includes information about the required dependency packages for NachOS.
  - If you want to run NachOS on Docker or WSL2, you can follow the provided guide.
  - If you're interested in learning how to use gdb (GNU Debugger) with Visual Studio Code for NachOS development, there's also a guide available.
  - **Please be aware that this repository uses NachOS 4.1, which has a different source code structure compared to our NachOS 4.0. Additionally, it does not have the `PrintInt()` system call implemented, which means you'll need to implement the `PrintInt()` system call yourself if you choose to use this version.**
