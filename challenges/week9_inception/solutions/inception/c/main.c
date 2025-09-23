#include <stdio.h>
#include <stdlib.h>
#include "nqueens.h"

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <n>\n", argv[0]);
        return 1;  // Exit with error code if argument is missing or invalid
    }

    // Convert the command-line argument to an integer
    int n = atoi(argv[1]);

    if (n <= 0) {
        printf("Please provide a valid positive integer for n.\n");
        return 1;
    }

    printf("Calling N-Queens for n = %d:\n", n);
    run_nqueens(n);  // Calling the N-Queens function with n from command-line argument

    return 0;
}

