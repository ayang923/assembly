#include <stdio.h>

int main() {
  char charArray[] = "Hello World\n";
  char* i;
  
  for(i = &charArray[0]; *i != 00; i++) {
    printf("%p: %02x\n", i, *i);
  }
  printf("%p: %02x\n", i, *i);
  return 0;
  }
