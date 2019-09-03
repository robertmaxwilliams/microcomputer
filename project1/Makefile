all: clean example1 p1 p2 p3 p3b
say_hello:
	@echo "available targets: example1"

p1:
	gcc -S P1-1.c
p2:
	gcc -S P1-2.c
p3:
	gcc -S P1-3.c
p3b:
	gcc -o p3b P1-3B.c P1-3BASM.s
calc:
	gcc -o calc calc.c calc.s
example1:
	as -g -mfpu=vfp -o example1.o example1.s
	ld -o example1 example1.o
clean:
	rm -fv *.o
	rm -fv example1 P1-1.s P1-2.s P1-3.s p3b calc

