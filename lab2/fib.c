#include <stdio.h>

int main() {
  int n;
  
  printf("Enter Finbonacci term: ");
  scanf("%d", &n);

  printf("The %dth fibonacci number is %d\n", n, fib(n));
  
  return 0;
}

int fib(int n) {
  int a = 1;
  int b = 1;
  int c;
  
  for (int i = 2; i < n; i++) {
    c = a+b;
    a = b;
    b = c;
  }

  return c;
}



