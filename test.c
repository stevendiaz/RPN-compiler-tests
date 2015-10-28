#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <stdint.h>

extern int64_t compute (int64_t x, int64_t y, int64_t z);

void testFunction() {
  int64_t x = 1;
  int64_t y = 2;
  int64_t z = 3;
  int64_t result = compute(x,y,z);
  printf("RESULT: %lld\n", (long long)result);
}


int main() {
  testFunction();
}
