#!/bin/bash
reset

pushd .

rm -rf install
mkdir install

# Remove Old versions
rm energy_1.6.2.tar.gz
R CMD REMOVE --library=install energy

# build new version
R CMD build --no-build-vignettes --no-manual energy

# install in our directory
R CMD INSTALL --library=install energy_1.6.2.tar.gz 

popd
