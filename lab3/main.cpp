#include <iostream>

long double pi(long long n) {
    int sg = -1;
    long double pi_ = 1;

    for (long long i = 1; i < n; i++) {
        pi_ += (long double)sg / (2 * (long double)i + 1);
        sg *= -1;

    }

    pi_ *= 4;

    return pi_;
}


int main() {
    long long n;
    std::cin >> n;

    std::cout << pi(n) << std::endl;

    return 0;

}
