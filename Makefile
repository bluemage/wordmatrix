CC = gcc
CFLAGS = -O2 -DNCURSES_WIDECHAR=1 -DEXCLUDE_CONFIG_H -DVERSION=\"dev\" \
  -DHAVE_UNISTD_H -DHAVE_SYS_IOCTL_H -DHAVE_TERMIOS_H -DHAVE_GETOPT_H
LDLIBS = -lncursesw
SRC = ../cmatrix/cmatrix.c

all: wcmatrix

wcmatrix: $(SRC)
	$(CC) $(CFLAGS) $< $(LDLIBS) -o $@

.PHONY: clean
clean:
	rm -f wcmatrix
