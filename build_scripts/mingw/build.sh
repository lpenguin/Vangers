#!/bin/bash
rm -rf build/
mkdir -p build
cd build
cmake -G "MSYS Makefiles" ..
make