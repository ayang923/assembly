
int prime(int n) {

  int isPrime = 1;
  int i;
  
  for (i = 2; i<n; i++) {
    if (n % i == 0) {
      isPrime = 0;
      break;
    }
  }
  
  return isPrime;
}
