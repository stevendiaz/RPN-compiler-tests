#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <stdint.h>

extern int64_t compute (int64_t x, int64_t y, int64_t z);

void testFunction(int64_t x, int64_t y, int64_t z) {
  int64_t result = compute(x,y,z);
  printf("RESULT: %lld\n", (long long)result);
}


int main(int argc, char *argv[]) {
        int64_t x;
        int64_t y;
        int64_t z;
        if(argc != 3) {
          x = 70;
          y = 80;
          z = 90;
          printf("Invalid arguments: must be 3 integers\n");
          printf("Setting x,y,z to default...");
        } else {
          x = atoi(argv[1]);
          y = atoi(argv[2]);
          z = atoi(argv[3]);
        }
        testFunction(x,y,z);
        return 0;
}
