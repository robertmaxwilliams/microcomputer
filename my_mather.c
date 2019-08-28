#include <stdio.h>
#include <inttypes.h>

int64_t add(int64_t, int64_t);
int64_t subtract(int64_t, int64_t);
int64_t multiply(int64_t, int64_t);
int64_t divide(int64_t, int64_t);


int main() {
    printf("%ld\n", add(1, 2));
    printf("%ld\n", subtract(1, 4));
    printf("%ld\n", multiply(3, 5));
    printf("%ld\n", divide(11, 2));
    return 0;
}
