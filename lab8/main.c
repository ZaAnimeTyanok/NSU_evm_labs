#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>
#include <time.h>
#include <immintrin.h>
#include <limits.h>

#define K 10 
#define N_MIN 256  //*4 = 1Kb
#define N_MAX 8388608  //*4 = 32Mb

void swap(int* a, int* b) {
    int c = *a;
    *a = *b;
    *b = c;
}

void forward(int* arr, int N) {
    for (int i = 0; i < N - 1; i++) {
        arr[i] = i + 1;
    }

    arr[N - 1] = 0;
}

void reverse(int* arr, int N) {
    for (int i = N - 1; i > 0; i--) {
        arr[i] = i - 1;
    }

    arr[0] = N - 1;
}

void random_(int* arr, int N) {
    for (int i = 0; i < N; i++) {
        arr[i] = i;
    }

    for (int i = N - 1; i > 0; i--) {
        swap(&arr[i], &arr[rand() % i]);
    }

}

const int COUNT = 10;

long double tacts(int* arr, int N, FILE* log, char* mod) {
    long double min_avg = ULLONG_MAX;

    for (int it = 0; it < COUNT; it++) {
        volatile int x = 0;
        
        for (int i = 0; i < N; i++) {
            x = arr[x];
        }

        unsigned long long start, end;
        start = __rdtsc();

        for (int i = 0; i < N * K; i++) {
            x = arr[x];
        }

        end = __rdtsc();
        
        long double avg = (long double)(end - start) / (N * K);
        
        fprintf(log, "%d;%d;%d;%llu;%llu;%.2Lf;%s\n", (int)N, (int)K, it, start, end, avg, mod);

        

        if (min_avg > avg)
            min_avg = avg;
    }

    return min_avg;
}

int main() {
    srand(time(NULL));

    FILE* out = fopen("result.csv", "w");
    FILE* log = fopen("log.csv", "w");

    fprintf(out, "Size;Forward;Reverse;Random\n");
    fprintf(log, "N;K;count_it;start;end;result;mod\n");
    
    char* mod;

    for (int N = N_MIN; N <= N_MAX; N *= 2) {
        int* arr = (int*)malloc(N * sizeof(int));

        if (arr == NULL) {
            fprintf(stderr, "Memory allocation failed for N: %d\n", N);
            exit(EXIT_FAILURE);
        }

        mod = "forward\0";

        forward(arr, N);
        long double time_forward = tacts(arr, N, log, mod);
       
        mod = "reverse\0";

        reverse(arr, N);
        long double time_reverse = tacts(arr, N, log, mod);
        
        mod = "random\0";
        
        random_(arr, N);
        long double time_random = tacts(arr, N, log, mod);

        fprintf(out, "%d;%.2Lf;%.2Lf;%.2Lf\n", N * (int)sizeof(int), time_forward, time_reverse, time_random);

        free(arr);
    }

    fclose(out);
    fclose(log);

    return 0;
}
