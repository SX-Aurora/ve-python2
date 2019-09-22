#!/bin/bash
#

rm -rf ~/.cache/pip

./01a_build_zlib.sh 2>&1 | tee 01a_build_zlib.log
./01b_build_libffi.sh 2>&1 | tee 01b_build_libffi.log
./01c_build_openssl.sh 2>&1 | tee 01c_build_openssl.log
./02a_build_python.sh 2>&1 | tee 02a_build_python.log
