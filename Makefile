CC = gcc
PKG_CFLAGS := $(shell pkg-config --cflags ncursesw 2>/dev/null)
PKG_LIBS   := $(shell pkg-config --libs ncursesw 2>/dev/null)
LDLIBS     = $(if $(PKG_LIBS),$(PKG_LIBS),-lncursesw)

CFLAGS = -O2 -DNCURSES_WIDECHAR=1 -DEXCLUDE_CONFIG_H -DVERSION=\"dev\" \
  -DHAVE_UNISTD_H -DHAVE_SYS_IOCTL_H -DHAVE_TERMIOS_H -DHAVE_GETOPT_H \
  -DHAVE_USE_DEFAULT_COLORS -DUSE_TIOCSTI -DHAVE_RESIZETERM -DHAVE_WRESIZE \
  $(PKG_CFLAGS)

SRC = /home/magesage/Documents/wordmatrix/cmatrix/cmatrix.c
BIN = wcmatrix

all: $(BIN)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) $< $(LDLIBS) -o $@

.PHONY: clean
clean:
	rm -f $(BIN)
