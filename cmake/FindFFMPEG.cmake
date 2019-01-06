# Locate the FFmpeg libraries
# This module defines
# {AVUTIL,AVCODEC,AVFORMAT}_INCLUDE_DIR
# {AVUTIL,AVCODEC,AVFORMAT}_LIBRARY
# FFMPEG_INLUDE_DIRS
# FFMPEG_LIBRARIES
#

FIND_PATH(AVUTIL_INCLUDE_DIR
	NAMES
		libavutil/avutil.h
	PATHS
		/usr/include
		/usr/include/x86_64-linux-gnu
		/usr/local/include
		/local/include
		/mingw/include
		/opt/local/include
		/opt/include
		/sw/include
		/usr/include/libavutil
		/usr/include/ffmpeg
		/usr/include/ffmpeg/libavutil
        /mingw32/include
)

FIND_PATH(AVCODEC_INCLUDE_DIR
	NAMES
		libavcodec/avcodec.h
	PATHS
		/usr/include
		/usr/include/x86_64-linux-gnu
		/usr/local/include
		/opt/local/include
		/local/include
		/mingw/include
        /mingw32/include
		/opt/include
		/sw/include
		/usr/include/libavcodec
		/usr/include/ffmpeg
		/usr/include/ffmpeg/libavcodec
)

FIND_PATH(AVFORMAT_INCLUDE_DIR
	NAMES
		libavformat/avformat.h
	PATHS
		/usr/include
		/usr/include/x86_64-linux-gnu
		/usr/local/include
		/opt/local/include
		/local/include
		/mingw/include
        /mingw32/include
		/opt/include
		/sw/include
		/usr/include/libavformat
		/usr/include/ffmpeg
		/usr/include/ffmpeg/libavformat
)

FIND_LIBRARY(AVUTIL_LIBRARY
	NAMES
		avutil
		avutil-55
		avutil-56
	PATHS
		/usr/lib
		/usr/lib/x86_64-linux-gnu
		/usr/lib/ffmpeg
		/usr/local/lib
		/opt/local/lib
		/sw/lib
		/local/lib
		/mingw/lib
		/local/bin
		/mingw/bin
        /mingw32/bin
		/bin
)

FIND_LIBRARY(AVCODEC_LIBRARY
	NAMES
		avcodec
		avcodec-57
		avcodec-58
	PATHS
		/usr/lib
		/usr/lib/x86_64-linux-gnu
		/usr/local/lib
		/opt/local/lib
		/sw/lib
		/local/lib
		/mingw/lib
		/local/bin
		/mingw/bin
        /mingw32/bin
		/bin
)

FIND_LIBRARY(AVFORMAT_LIBRARY
	NAMES
		avformat
		avformat-57
		avformat-58
	PATHS
		/usr/lib
		/usr/lib/x86_64-linux-gnu
		/usr/lib/ffmpeg
		/usr/local/lib
		/opt/local/lib
		/sw/lib
		/local/lib
		/local/bin
		/mingw/bin
        /mingw32/bin
		/mingw/lib
		/bin
)

SET(FFMPEG_INCLUDE_DIRS
	#${AVUTIL_INCLUDE_DIR}
	${AVCODEC_INCLUDE_DIR}
	${AVFORMAT_INCLUDE_DIR}
)

SET(FFMPEG_LIBRARIES)

IF(AVUTIL_LIBRARY)
	SET(FFMPEG_LIBRARIES
		${FFMPEG_LIBRARIES}
		${AVUTIL_LIBRARY}
	)
ENDIF(AVUTIL_LIBRARY)

IF(AVCODEC_LIBRARY)
	SET(FFMPEG_LIBRARIES
		${FFMPEG_LIBRARIES}
		${AVCODEC_LIBRARY}
	)
ENDIF(AVCODEC_LIBRARY)

IF(AVFORMAT_LIBRARY)
	SET(FFMPEG_LIBRARIES
		${FFMPEG_LIBRARIES}
		${AVFORMAT_LIBRARY}
	)
ENDIF(AVFORMAT_LIBRARY)

IF(FFMPEG_INCLUDE_DIRS AND FFMPEG_LIBRARIES)
	SET(FFMPEG_FOUND TRUE)
ENDIF(FFMPEG_INCLUDE_DIRS AND FFMPEG_LIBRARIES)

IF(FFMPEG_FOUND)
	IF(NOT FFMPEG_FIND_QUIETLY)
		MESSAGE(STATUS "Found FFmpeg: ${FFMPEG_LIBRARIES}")
	ENDIF(NOT FFMPEG_FIND_QUIETLY)
ELSE(FFMPEG_FOUND)
	IF(FFMPEG_FIND_REQUIRED)
		MESSAGE(FATAL_ERROR "Could not find FFmpeg")
	ENDIF(FFMPEG_FIND_REQUIRED)
ENDIF(FFMPEG_FOUND)
