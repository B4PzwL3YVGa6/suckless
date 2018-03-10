VERSION = 0.7

# paths
# PREFIX = /usr/local
PREFIX = ${HOME}/usr
MANPREFIX = $(PREFIX)/share/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# includes and libs
INCS = -I$(X11INC) \
       `pkg-config --cflags fontconfig` \
       `pkg-config --cflags freetype2`



# OpenBSD
LIBS = -L$(X11LIB) -lm -lX11 -lutil -lXft \
       `pkg-config --libs fontconfig` \
       `pkg-config --libs freetype2`

# LINUX 
#LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft \
#		   `pkg-config --libs fontconfig` \
#	       	   `pkg-config --libs freetype2`

# flags
CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
STCFLAGS = $(INCS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS = $(LIBS) $(LDFLAGS)

CC = gcc -O3 -std=c99 -pedantic