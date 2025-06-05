#include <stdio.h>
#include <stdlib.h>

int count = 0;

void solve(int n, int col, int *hist)
{
    if (col == n) {
        printf("No. %d\n-----\n", ++count);
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (hist[i] == j) {
                    putchar('Q'); // Queen at the correct position
                } else {
                    putchar('.'); // Empty space
                }
            }
            putchar('\n');
        }
        return;
    }

    for (int i = 0; i < n; i++) {
        int valid = 1;

        // Check if the current position is safe for placing the queen
        for (int j = 0; j < col; j++) {
            if (hist[j] == i || abs(hist[j] - i) == col - j) {
                valid = 0;
                break;
            }
        }

        // If position is safe, place the queen
        if (valid) {
            hist[col] = i;
            solve(n, col + 1, hist);
        }
    }
}

extern void hello(const char* name);

void run_nqueens(int n)
{
    count = 0;
    int hist[n];
    solve(n, 0, hist);

    // int to char*
    char buffer[16]; 
    snprintf(buffer, sizeof(buffer), "%d", n);  
    hello(buffer);

}
