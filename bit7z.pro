#VERSION  = 3.0
TEMPLATE = lib
CONFIG  += staticlib
CONFIG  -= app_bundle
CONFIG  -= qt

SOURCES += lib/7zSDK/C/Alloc.c \
           lib/7zSDK/CPP/Windows/FileIO.cpp \
           lib/7zSDK/CPP/Windows/FileDir.cpp \
           lib/7zSDK/CPP/Windows/FileName.cpp \
           lib/7zSDK/CPP/Windows/FileFind.cpp \
           lib/7zSDK/CPP/7zip/Common/FileStreams.cpp \
           lib/7zSDK/CPP/7zip/Common/StreamObjects.cpp \
           lib/7zSDK/CPP/Common/IntToString.cpp \
           lib/7zSDK/CPP/Common/MyString.cpp \
           lib/7zSDK/CPP/Common/MyVector.cpp \
           src/bit7zlibrary.cpp \
           src/bitarchivecreator.cpp \
           src/bitarchivehandler.cpp \
           src/bitarchiveinfo.cpp \
           src/bitarchiveitem.cpp \
           src/bitarchiveopener.cpp \
           src/bitcompressor.cpp \
           src/bitexception.cpp \
           src/bitextractor.cpp \
           src/bitformat.cpp \
           src/bitguids.cpp \
           src/bitmemcompressor.cpp \
           src/bitmemextractor.cpp \
           src/bitpropvariant.cpp \
           src/callback.cpp \
           src/coutmemstream.cpp \
           src/coutmultivolstream.cpp \
           src/extractcallback.cpp \
           src/fsindexer.cpp \
           src/fsitem.cpp \
           src/fsutil.cpp \
           src/memextractcallback.cpp \
           src/memupdatecallback.cpp \
           src/opencallback.cpp \
           src/updatecallback.cpp \
           src/util.cpp

INCLUDEPATH += lib/7zSDK/CPP/

QMAKE_CFLAGS_WARN_ON = -W4
QMAKE_CXXFLAGS_WARN_ON = -W4

DEFINES += _UNICODE _7Z_VOL

HEADERS += include/bit7z.hpp \
           include/bit7zlibrary.hpp \
           include/bitarchivecreator.hpp \
           include/bitarchivehandler.hpp \
           include/bitarchiveinfo.hpp \
           include/bitarchiveitem.hpp \
           include/bitarchiveopener.hpp \
           include/bitcompressionlevel.hpp \
           include/bitcompressor.hpp \
           include/bitexception.hpp \
           include/bitextractor.hpp \
           include/bitformat.hpp \
           include/bitguids.hpp \
           include/bitmemcompressor.hpp \
           include/bitmemextractor.hpp \
           include/bitpropvariant.hpp \
           include/bittypes.hpp \
           include/callback.hpp \
           include/coutmemstream.hpp \
           include/coutmultivolstream.hpp \
           include/extractcallback.hpp \
           include/fsindexer.hpp \
           include/fsitem.hpp \
           include/fsutil.hpp \
           include/memextractcallback.hpp \
           include/memupdatecallback.hpp \
           include/opencallback.hpp \
           include/updatecallback.hpp \
           include/util.hpp

contains(QT_ARCH, i386) {
    QMAKE_LFLAGS         += /MACHINE:X86
    PLATFORM = x86
} else {
    QMAKE_LFLAGS         += /MACHINE:X64
    PLATFORM = x64
    ARCH_SUFFIX = 64
}

CONFIG(debug, debug|release) {
    BUILD = debug
    BUILD_SUFFIX = _d
} else {
    BUILD = release
}

TARGET =  bit7z$${ARCH_SUFFIX}$${BUILD_SUFFIX}

DESTDIR  = $$PWD/bin/$${PLATFORM}/
OBJECTS_DIR = $$PWD/build/$${PLATFORM}/$${BUILD}/.obj
RCC_DIR  = $$PWD/build/$${PLATFORM}/$${BUILD}/.rcc
