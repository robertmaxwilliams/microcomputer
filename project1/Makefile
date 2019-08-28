all: clean example1
say_hello:
	@echo "available targets: example1"
example1:
	as -g -mfpu=vfp -o example1.o example1.s
	ld -o example1 example1.o
clean:
	rm -fv *.o
	rm -fv example1

