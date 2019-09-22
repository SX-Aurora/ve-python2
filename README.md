# Python 2 for VE


## Introduction

This is a recipe (actually a set of scripts) that will help you build
Python 2.7.16 natively for the SX-Aurora TSUBASA Vector Engine
(VE). It is based upon the work of Laurent Gatineau from NEC, slightly
adjusted and made to download required packages from the internet.

The code is built in scalar mode with no vectorization at
all. Therefore this is not to be used for any serious numerical
simulations inside Python. It is rather good for programs which use
Python as a driver which controls code from other highly optimized
libraries.


## Prerequisites

A VH (vector host) machine with a normal installation including VE
compilers (ncc, nc++, nfort), MPI for VE version 2.2.0 and the NLC
2.0.0 optimized library collection for the VE.

The machine should have a connection to the internet or the proxy
settings should be configured properly, by setting the environment
variables `https_proxy, http_proxy`.


## Building

Clone this repository:
```sh
git clone https://github.com/sx-aurora/ve-python2
```
then change working directory to it:
```sh
cd ve-python2
```

Decide for the target directory of the installation. Edit the file
`env.sh` and adjust the variable `PREFIX` accordingly.

Build by doing
```sh
./build_it.sh
```

This will download and build **zlib**, **openssl**, **libffi** and
**python**. They get installed into the path specified by
`PREFIX`. The sources end up in the `Data` subdirectory.

