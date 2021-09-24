.PHONY: webgen all

all:
	dmd itc.d -L/usr/lib/libiconf.a
	cp ./itc /usr/bin/itc

install: all

webgen:
	dmd -Dd./docs/api itc.d