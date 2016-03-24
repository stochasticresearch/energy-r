#!/bin/bash
reset

pushd .

rm -rf install
mkdir install

# Remove Old versions
rm copula_0.999-14.tar.gz
R CMD REMOVE --library=install copula

# build new version
R CMD build --no-build-vignettes --no-manual copula

# install in our directory
R CMD INSTALL --library=install copula_0.999-14.tar.gz

## Do some auxiliary stuff that I need for testing purposes
cd copula/src
R CMD SHLIB logseries.c
rm logseries.o
mv logseries.so ../../install/

popd
