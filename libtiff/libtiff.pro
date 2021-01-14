TARGET = tiff
VERSION = 4.0.6
TEMPLATE = lib

INCLUDEPATH += $$PWD/libtiff
SOURCES += \
    $$PWD/libtiff/tif_aux.c \
    $$PWD/libtiff/tif_close.c \
    $$PWD/libtiff/tif_codec.c \
    $$PWD/libtiff/tif_color.c \
    $$PWD/libtiff/tif_compress.c \
    $$PWD/libtiff/tif_dir.c \
    $$PWD/libtiff/tif_dirinfo.c \
    $$PWD/libtiff/tif_dirread.c \
    $$PWD/libtiff/tif_dirwrite.c \
    $$PWD/libtiff/tif_dumpmode.c \
    $$PWD/libtiff/tif_error.c \
    $$PWD/libtiff/tif_extension.c \
    $$PWD/libtiff/tif_fax3.c \
    $$PWD/libtiff/tif_fax3sm.c \
    $$PWD/libtiff/tif_flush.c \
    $$PWD/libtiff/tif_getimage.c \
    $$PWD/libtiff/tif_luv.c \
    $$PWD/libtiff/tif_lzw.c \
    $$PWD/libtiff/tif_next.c \
    $$PWD/libtiff/tif_open.c \
    $$PWD/libtiff/tif_packbits.c \
    $$PWD/libtiff/tif_pixarlog.c \
    $$PWD/libtiff/tif_predict.c \
    $$PWD/libtiff/tif_print.c \
    $$PWD/libtiff/tif_read.c \
    $$PWD/libtiff/tif_strip.c \
    $$PWD/libtiff/tif_swab.c \
    $$PWD/libtiff/tif_thunder.c \
    $$PWD/libtiff/tif_tile.c \
    $$PWD/libtiff/tif_version.c \
    $$PWD/libtiff/tif_warning.c \
    $$PWD/libtiff/tif_write.c \
    $$PWD/libtiff/tif_zip.c \
    $$PWD/port/snprintf.c

wince*:       SOURCES += $$PWD/libtiff/tif_win32.c
win32:        SOURCES += $$PWD/libtiff/tif_win32.c
else:         SOURCES += $$PWD/libtiff/tif_unix.c
android:      SOURCES += $$PWD/port/lfind.c

DEFINES += QTIFF_COMPILE_LIBRARY

win32 {
    LIBS += -L$$PWD/../zlib/lib/ -lzdll
    INCLUDEPATH += $$PWD/../zlib/include
    DEPENDPATH += $$PWD/../zlib/include
    CONFIG(release) {
        DESTDIR = ../libtiff-build
        destFolder = $$DESTDIR
        destFolder = $$replace(destFolder, /, \\)
        includeFolder = $$PWD/libtiff
        includeFolder = $$replace(includeFolder, /, \\)
        system(xcopy /V /R /Y $$includeFolder\tiff.h $$destFolder\\include\\)
        system(xcopy /V /R /Y $$includeFolder\tiffconf.h $$destFolder\\include\\)
        system(xcopy /V /R /Y $$includeFolder\tiffio.h $$destFolder\\include\\)
        system(xcopy /V /R /Y $$includeFolder\tiffvers.h $$destFolder\\include\\)
    }
}

HEADERS += \
    libtiff/t4.h \
    libtiff/tif_config.h \
    libtiff/tif_config.vc.h \
    libtiff/tif_config.wince.h \
    libtiff/tif_dir.h \
    libtiff/tif_fax3.h \
    libtiff/tif_predict.h \
    libtiff/tiff.h \
    libtiff/tiffconf.h \
    libtiff/tiffconf.vc.h \
    libtiff/tiffconf.wince.h \
    libtiff/tiffio.h \
    libtiff/tiffio.hxx \
    libtiff/tiffiop.h \
    libtiff/tiffvers.h \
    libtiff/uvcode.h
