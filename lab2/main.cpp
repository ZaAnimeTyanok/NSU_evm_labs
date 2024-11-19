#include <iostream>
#include <intrin.h>
#include <vector>
#include <iomanip>

using namespace std;

long double pi_num_test(long long n, bool print_pi) {
    unsigned long long start = __rdtsc();

    int sg = -1;
    long double pi = 1;

    for (long long i = 1; i < n; i++) {
        pi += (long double)sg / (2 * (long double)i + 1);
        sg *= -1;

    }
    
    pi *= 4;

    unsigned long long finish = __rdtsc();

    if (print_pi){
        cout << "pi_value: " << setprecision(16) <<  pi << setprecision(5) << endl;
    }

    return (long double)(finish - start) / (long double)2000000000;
}


int main() {
    long double sm = 0;
    int test_count = 5;
    vector<long long> test_arr = {8000000000, 12000000000, 16000000000};
    
    long double min_time = 0;


    for (int j = 0; j < test_arr.size(); j++){
        cout << "test" << j << " n: " << test_arr[j] << endl;
        bool print_pi = 1;

        for (int i = 0; i < test_count; i++) {
            
            long double time = pi_num_test(test_arr[j], print_pi);
            
            if (min_time){
                min_time = min(min_time, time);
            }
            
            else {
                min_time = time;

            }

            print_pi = 0;
            sm += time;

            cout << i << ": " << time << endl;
        }

        min_time = 0;

        cout << "min value: " << sm / test_count << endl;
        sm = 0;

        cout << endl;

    }

    return 0;
    
}
