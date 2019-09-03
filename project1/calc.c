
//Eugene Rockey, Copyright 2018, All rights reserved.
//Project 1 Part 3B
//Compile the program by entering ‘gcc P1-3B.c P1-3BASM.s’ and check for errors.
//Run the program by entering './a.out' at the command line.
//Generate Assembly listing by entering 'gcc -S P1-3B.c P1-3BASM.s'
//Open the generated equivalent Assembly file ‘P1-3B.s’ and fulfill part 3B requirements.

#include <stdio.h>
#include <stdlib.h>
unsigned char next_char(char in);

int add(int a, int b) {return a + b;}
int sub(int a, int b) {return a - b;}
int mult(int a, int b) {return a * b;}
int divide(int a, int b) {return a / b;}
int rem(int a, int b) {return a % b;}

void main()
{
    printf("What operation would you like to perfom today? Choose from [+, -, *, /]: ");
    char c;
    char newline_eater;
    scanf(" %c[^\n]%c", &c, &newline_eater);
    printf("You entered: ");
    putchar(c);
    printf("\n");

    int a;
    int b;
    printf("Enter first number: ");
    scanf(" %d[^\n]%c", &a);

    printf("Enter second number: ");
    scanf(" %d[^\n]%c", &b);

    int result;
    int result2;
    int is_result2_used = 0;

    switch(c) {
        case '+':
            result = add(a, b);
            break;
        case '-':
            result = sub(a, b);
            break;
        case '*':
            result = mult(a, b);
            break;
        case '/':
            result = divide(a, b);
            result2 = rem(a, b);
            is_result2_used = 1;
            break;
    }
    if (is_result2_used)
        printf("%d %c %d = %d, remainder %d\n", a, c, b, result, result2);
    else
        printf("%d %c %d = %d\n", a, c, b, result);
}
