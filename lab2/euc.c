#include<stdio.h>

int main() {
  int a, b;
  printf("Enter number 1: ");
  scanf("%d", &a);
  printf("Enter number 2: ");
  scanf("%d", &b);

  if (a < b) {
    int t = a;
    a = b;
    b = t;
  }

  while(a % b != 0) {
    int r = a % b;
    a = b;
    b = r;
  }

  printf("%d\n", b);

  return 0;
}
