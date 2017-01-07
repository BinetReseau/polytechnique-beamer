.PHONY: all clean cleandist linux-install

all:
	make -C source/ all

clean:
	make -C source/ clean

cleandist:
	make -C source/ cleandist

linux-install:
	sudo ./install/unix.sh

mac-install:
	sudo ./install/unix.sh
