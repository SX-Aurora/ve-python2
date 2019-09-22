#!/bin/bash
#

source env.sh

[ -d ve-ffi-master ] && rm -rf ve-ffi-master
#unzip -qa ${DATA}/ve-ffi-master.zip
git clone https://github.com/necla-ml/ve-ffi.git ve-ffi-master
cd ve-ffi-master
sed -i -e 's,^source ~/kruus/,#source ~/kruus/,' ve-autogen.sh

. ve-autogen.sh 2>&1 | tee ve-autogen.log
sed -i "s@^PREFIX=.*@PREFIX=${PREFIX}@" ve-conf-local.sh
. ve-conf-local.sh 2>&1 | tee ve-conf-local.log
cd build/
make
make install

exit 0
