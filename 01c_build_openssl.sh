#!/bin/bash
#

source env.sh

[ -d openssl-1.1.1c ] && rm -rf openssl-1.1.1c
if [ ! -f ${DATA}/openssl-1.1.1c.tar.gz ]; then
  wget -O ${DATA}/openssl-1.1.1c.tar.gz https://www.openssl.org/source/old/1.1.1/openssl-1.1.1c.tar.gz
fi
tar xzf ${DATA}/openssl-1.1.1c.tar.gz
cd openssl-1.1.1c
patch -p1 < ${DATA}/openssl-1.1.1c.patch

export CC="ncc -mno-vector -fdiag-vector=0 -traceback"

/usr/bin/perl ./Configure gcc --prefix=${PREFIX} no-asm no-threads no-pic
make
make install

exit 0
