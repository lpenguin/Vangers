#!/bin/bash
pacman -S --needed --noconfirm --noprogressbar \
  mingw64/mingw-w64-x86_64-cmake \
  mingw64/mingw-w64-x86_64-gcc \
  make \
  mingw64/mingw-w64-x86_64-ffmpeg \
  mingw64/mingw-w64-x86_64-libogg \
  mingw64/mingw-w64-x86_64-libvorbis \
  mingw64/mingw-w64-x86_64-SDL2 \
  mingw64/mingw-w64-x86_64-SDL2_image \
  mingw64/mingw-w64-x86_64-SDL2_net \
  mingw64/mingw-w64-x86_64-glm \
  mingw64/mingw-w64-x86_64-glew

rm -rf build_thirdparty
mkdir -p build_thirdparty
cd build_thirdparty
root=$PWD

# clunk
wget -O libclunk.tar.gz https://github.com/stalkerg/clunk/archive/1.0.tar.gz
tar xzf libclunk.tar.gz
mkdir clunk-1.0/build
cd clunk-1.0/build
cmake -G "MSYS Makefiles" -DCMAKE_INSTALL_PREFIX=/mingw64 ..
make && make install

