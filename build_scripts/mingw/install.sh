#!/bin/bash
pacman -S --needed --noconfirm --noprogressbar \
  mingw64/mingw-w64-x86_64-cmake \
  mingw64/mingw-w64-x86_64-gcc \
  make \
  yasm \
  mingw64/mingw-w64-x86_64-libogg \
  mingw64/mingw-w64-x86_64-libvorbis \
  mingw64/mingw-w64-x86_64-SDL2 \
  mingw64/mingw-w64-x86_64-SDL2_image \
  mingw64/mingw-w64-x86_64-SDL2_net \
  mingw64/mingw-w64-x86_64-glm \
  mingw64/mingw-w64-x86_64-glew \
  mingw64/mingw-w64-x86_64-glfw

rm -rf build/thirdparty
mkdir -p build/thirdparty
cd build/thirdparty
root=$PWD

# clunk
wget -O libclunk.tar.gz https://github.com/stalkerg/clunk/archive/1.0.tar.gz
tar xzf libclunk.tar.gz
mkdir clunk-1.0/build
cd clunk-1.0/build
cmake -G "MSYS Makefiles" ..
make && make install

cd $root
# FFmpeg
wget https://github.com/FFmpeg/FFmpeg/archive/n3.3.9.tar.gz
tar xzf n3.3.9.tar.gz
cd FFmpeg-n3.3.9
./configure --enable-shared \
	--disable-everything \
	--enable-swscale \
	--enable-zlib \
	--enable-demuxer=avi \
	--enable-decoder=png \
	--enable-parser=png \
	--enable-protocol=file \
	--disable-d3d11va \
	--disable-dxva2 \
	--disable-doc --disable-ffplay --disable-ffprobe --disable-ffmpeg \
	--disable-static --disable-bzlib --disable-libopenjpeg --disable-iconv
make && make install

