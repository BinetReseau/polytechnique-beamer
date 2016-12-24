.PHONY: all clean cleandist

all:
	make -C source/ all

clean:
	make -C source/ clean

cleandist:
	make -C source/ cleandist
