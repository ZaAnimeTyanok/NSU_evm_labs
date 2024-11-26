#include <iostream>
#include <intrin.h>
#include <vector>

using namespace std;

long double pi_num_test(long long n) {
    unsigned long long start = __rdtsc();

    int sg = -1;
    long double pi = 1;

    for (long long i = 1; i < n; i++) {
        pi += (long double)sg / (2 * (long double)i + 1);
        sg *= -1;

    }
    
    pi *= 4;

    unsigned long long finish = __rdtsc();

    return (long double)(finish - start) / (long double)2000000000;
}


int main() {
    long double min_time = 0;

    for (int i = 0; i < 10; i++) {
        long double time = pi_num_test(1800000000);

        if (min_time) {
            min_time = min(min_time, time);
        }

        else {
            min_time = time;
        }

        cout << i << ": " << time << endl;
    }

    cout << "min value: " << min_time << endl;

    return 0;

}
