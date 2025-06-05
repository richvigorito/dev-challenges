#include <stdio.h>

// 
// hello.c
// 
// this c programm calls assembly language progam: hello.asm
// hello.asm has 'hello' function which this programm calls
// 
// > 
// > # compile assembly code 
// > nasm -f elf64 hello.asm -o hello.o -g -F dwarf
// > 
// > # compile and link c code
// > gcc -no-pie hello.c hello.o -o hello_exec
// > 
// > # run:
// > ./hello_exec friends!
// > hello friends!
// 
// 

extern void hello(const char* name);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <n>\n", argv[0]);
        return 1;  // Exit with error code if argument is missing or invalid
    }

    hello(argv[1]);
    return 0;
}


