#!/bin/bash
#

source env.sh

[ -d zlib-1.2.11 ] && rm -rf zlib-1.2.11
if [ ! -f ${DATA}/zlib-1.2.11.tar.gz ]; then
  wget -O ${DATA}/zlib-1.2.11.tar.gz https://www.zlib.net/zlib-1.2.11.tar.gz
fi
tar xzf ${DATA}/zlib-1.2.11.tar.gz
cd zlib-1.2.11

export CFLAGS="-mno-vector -fdiag-vector=0 -traceback"
./configure --prefix=${PREFIX} --static
make
make install

exit 0
