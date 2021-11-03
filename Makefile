CC=gcc
CFLAGS=-Wall -g
calcula: calc.o calcula.c 
	$(CC) $(CFLAGS) calc.o calcula.c -o calcula

calc.o: calc.c
	$(CC) -c $(CFLAGS) calc.c -o calc.o

.PHONY:clean
clean:
	rm -rf *.o
	rm calcula

.PHONY: dist
dist: clean calcula
	rm -rf ../dist;
	mkdir -p ../dist/usr/bin/
	cp calcula ../dist/usr/bin/

.PHONY: targz
targz: clean
	mkdir -p source
	cp *.c *.h Makefile source
	tar -cvf calcula.tar source
	gzip calcula.tar
	rm -rf calcula.tar
	rm -rf source

install:dist
	cp -r ../dist/* /



