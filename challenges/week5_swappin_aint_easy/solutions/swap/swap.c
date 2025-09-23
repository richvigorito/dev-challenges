#include <stdio.h>

void tmpVarSwap(int *a, int *b) {
    int tmp = *a;
    *a = *b;
    *b = tmp;
}

void arithSwap(int *a, int *b) {
    *a = *a + *b;
    *b = *a - *b;
    *a = *a - *b;
}

void xorSwap(int *a, int *b) {
    *a = *a ^ *b;
    *b = *a ^ *b;
    *a = *a ^ *b;
}

int main() {
    int a = 5, b = 3;
    printf("Init: a=%d, b=%d\n", a, b);
    tmpVarSwap(&a, &b);
    printf("After Tmp Swap: a=%d, b=%d\n", a, b);
    arithSwap(&a, &b);
    printf("After Arith Swap: a=%d, b=%d\n", a, b);
    xorSwap(&a, &b);
    printf("After XOR Swap: a=%d, b=%d\n", a, b);
    return 0;
}


