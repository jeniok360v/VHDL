#include <stdio.h>
#include "shift_lfsr.h"
#include <math.h>

int main(void)
{
  const unsigned int init = 1;
  unsigned int v = init;


  v = 1;
  for (int i = 0; i < 20; i++) {
  	v = shift_lfsr(v) % (int)pow(2.0, 16.0);
  	printf("%d\n",v);
  }

// getchar();
//     v = shift_lfsr(v);
// 	printf("%d",v);

//   } while (v != init);
}