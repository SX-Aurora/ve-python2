#!/bin/bash
#

source env.sh

[ -d Python-2.7.16 ] && rm -rf Python-2.7.16
if [ ! -f ${DATA}/Python-2.7.16.tgz ]; then
  wget -O ${DATA}/Python-2.7.16.tgz https://www.python.org/ftp/python/2.7.16/Python-2.7.16.tgz
fi
tar xzf ${DATA}/Python-2.7.16.tgz
cd Python-2.7.16
patch -p1 < ${DATA}/Python-2.7.16.patch

#
# Needed for compilation with shared library support
#
export VE_LD_LIBRARY_PATH=${PWD}:${VE_LD_LIBRARY_PATH}

#
# We do cross compilation of Python
# so don't try to use local system x86 libraries/include
#
export _PYTHON_HOST_PLATFORM="linux2"

sed -i 's/STRICT_PROTO=.*/STRICT_PROTO=""/' configure

#
# Threads are needed by pip.
# Shared libraries are compiled with 2MiB page size to reduce memory footprint.
#
./configure --with-system-ffi --prefix=${PREFIX} --without-gcc --enable-shared --build=x86_64-gnu-linux \
            --with-cxx-main=nc++ --with-threads CFLAGS="-mno-vector -fdiag-vector=0 -fno-fast-math -traceback" \
            LINKCC="nfort" LDFLAGS="-traceback -Wl,-rpath=${PREFIX}/lib" LDSHARED="$CC -shared -Wl,-z,max-page-size=0x200000"

make

make install

exit 0
