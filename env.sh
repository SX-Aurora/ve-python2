#!/bin/bash
#

# For compilation
export PATH=/opt/nec/ve/bin:${PATH}
source /opt/nec/ve/mpi/2.2.0/bin/necmpivars.sh
source /opt/nec/ve/nlc/2.0.0/bin/nlcvars.sh

export PREFIX=`pwd`/usr
export DATA=`pwd`/Data

export NCC_INCLUDE_PATH=${PREFIX}/include:${NCC_INCLUDE_PATH}
export NCC_LIBRARY_PATH=${PREFIX}/lib:${NCC_LIBRARY_PATH}
export NFORT_INCLUDE_PATH=${PREFIX}/include:${NCC_INCLUDE_PATH}
export NFORT_LIBRARY_PATH=${PREFIX}/lib:${NFORT_LIBRARY_PATH}

#export PATH=/opt/nec/ve/nfort/2.3.23/bin:/opt/nec/ve/ncc/2.2.2/bin:${PATH}
#export PATH=/opt/nec/ve/nfort/2.3.0/bin:/opt/nec/ve/ncc/2.3.0/bin:${PATH}

export CC=ncc
export CXX=nc++
export FC=nfort
export AR=nar
export RANLIB=nranlib
export NM=nnm
export LD=nld

# For execution
export PATH=${PREFIX}/bin:${PATH}
export VE_LD_LIBRARY_PATH=${PREFIX}/lib:${VE_LD_LIBRARY_PATH}

export VE_NODE_NUMBER=0

