#!/bin/bash
rm -rf build/
mkdir -p build
cd build
cmake -G "MSYS Makefiles" -DBINARY_SCRIPT=OFF ..
make