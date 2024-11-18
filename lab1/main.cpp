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
    long double sm = 0;

    for (int i = 0; i < 10; i++) {
        long double time = pi_num_test(1800000000);
        sm += time;

        cout << i << ": " << time << endl;
    }

    cout << "middle value: " << sm / 10 << endl;

    return 0;

}
