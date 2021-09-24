all:
	dmd itc.d -L/usr/lib/libiconf.a
	cp ./itc /usr/bin/itc
