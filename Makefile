PREFIX ?= /usr/local

CFLAGS += -g -O2 -fPIC

all: libgbm.so.1

libgbm.so.1: gbm.c

libgbm.so.1:
	$(CC) -Wall -shared -Wl,-soname,$@ $^ -o $@ $(CFLAGS) $(LDFLAGS)

clean:
	$(RM) *.so*

install: all
	install -d $(DESTDIR)$(PREFIX)/lib/pkgconfig
	install libgbm.so.1 $(DESTDIR)$(PREFIX)/lib
	sed "/^prefix=/s|=.*|=$(PREFIX)|" gbm.pc > $(DESTDIR)$(PREFIX)/lib/pkgconfig/gbm.pc
