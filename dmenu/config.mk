VERSION = 4.7

# PREFIX = /usr/local
PREFIX = ${HOME}/usr
MANPREFIX = ${PREFIX}/share/man

# Linux / OpenBSD
X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib
# DragonFly BSD
# X11INC = /usr/local/include
# X11LIB = /usr/local/lib

XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

FREETYPELIBS = -lfontconfig -lXft
# LINUX 
#FREETYPEINC = /usr/include/freetype2
# OpenBSD / DragonFly BSD
FREETYPEINC = ${X11INC}/freetype2

INCS = -I${X11INC} -I${FREETYPEINC}
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS} -lm

CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
LDFLAGS  = -s ${LIBS}

CC = gcc -O3