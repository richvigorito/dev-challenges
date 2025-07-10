// sum_engines.c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define N 5000000
#define MIN_CENTS 50
#define MAX_CENTS 200

void generate_values(double *values, int n) {
    srand(time(NULL));
    for (int i = 0; i < n; i++) {
        int cents = rand() % (MAX_CENTS - MIN_CENTS + 1) + MIN_CENTS;
        values[i] = cents / 100.0;
    }
}

double penny_engine(double *values, int n) {
    long total_pennies = 0;
    for (int i = 0; i < n; i++) {
        total_pennies += (long)(values[i] * 100);
    }
    return total_pennies / 100.0;
}

double float_engine(double *values, int n) {
    double total = 0.0;
    for (int i = 0; i < n; i++) {
        total += values[i];
    }
    return total;
}

double kahan_engine(double *values, int n) {
    double sum = 0.0;
    double c = 0.0;
    for (int i = 0; i < n; i++) {
        double y = values[i] - c;
        double t = sum + y;
        c = (t - sum) - y;
        sum = t;
    }
    return sum;
}

int main() {
    double *values = malloc(sizeof(double) * N);
    generate_values(values, N);

    double p_total = penny_engine(values, N);
    double f_total = float_engine(values, N);
    double k_total = kahan_engine(values, N);

    printf("Total using PennyEngine: %.10f\n", p_total);
    printf("Total using FloatMathEngine: %.10f\n", f_total);
    printf("Total using KahanEngine: %.10f\n", k_total);

    free(values);
    return 0;
}

// Compile with: gcc -o sum_engines sum_engines.c -lm
// Run with: ./sum_engines
