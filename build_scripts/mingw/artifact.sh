#!/bin/bash
artifact_dir=artifact/vangers/
mkdir -p $artifact_dir

cp build/src/vangers.exe $artifact_dir
cp -r data $artifact_dir

cp /mingw64/bin/AVCODEC-57.DLL $artifact_dir
cp /mingw64/bin/AVFORMAT-57.DLL $artifact_dir
cp /mingw64/bin/AVUTIL-55.DLL $artifact_dir
cp /mingw64/bin/GLEW32.DLL $artifact_dir
cp /mingw64/bin/LIBGCC_S_SEH-1.DLL $artifact_dir
cp /mingw64/bin/LIBJPEG-8.DLL $artifact_dir
cp /mingw64/bin/LIBLZMA-5.DLL $artifact_dir
cp /mingw64/bin/LIBOGG-0.DLL $artifact_dir
cp /mingw64/bin/LIBPNG16-16.DLL $artifact_dir
cp /mingw64/bin/LIBSTDC++-6.DLL $artifact_dir
cp /mingw64/bin/LIBTIFF-5.DLL $artifact_dir
cp /mingw64/bin/LIBVORBIS-0.DLL $artifact_dir
cp /mingw64/bin/LIBVORBISFILE-3.DLL $artifact_dir
cp /mingw64/bin/LIBWEBP-7.DLL $artifact_dir
cp /mingw64/bin/LIBWINPTHREAD-1.DLL $artifact_dir
cp /mingw64/bin/SDL2.DLL $artifact_dir
cp /mingw64/bin/SDL2_IMAGE.DLL $artifact_dir
cp /mingw64/bin/SDL2_NET.DLL $artifact_dir
cp /mingw64/bin/ZLIB1.DLL $artifact_dir
cp /mingw64/lib/libclunk.dll $artifact_dir