#!/bin/bash

PYTHON_VERSION=3.5
export CPLUS_INCLUDE_PATH=/usr/include/python${PYTHON_VERSION}
OS=`uname -s`
JOS=windows

if [[ $OS == "Darwin" ]]; then
  JOS=osx
fi

if [[ $OS == "Linux" ]]; then
  JOS=linux
fi

echo Downloading for $JOS

mkdir -p assets
curl -L -o assets/boost.tar.gz https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.gz
cd assets && tar xzf boost.tar.gz
cd boost_1_73_0
# Build Boost for python 3
./bootstrap.sh --with-python=/usr/bin/python${PYTHON_VERSION}
./b2 --with-python --buildid=3

# Install Boost system wide.
sudo ./b2 install
