 #include<stdio.h>

int main() {
  int zip;
  
  printf("Enter a zip code: ");
  scanf("%d", &zip);
  
  char outString[32];
  char *p = outString;
  *p = '|';
  p++;
  int d;
  int z = zip;
  for (int i = 4; i >= 0; i--) {
    d = z / base(i);

    if (d == 0) {
      digit_pat_0(p);
    }
    else {
      digit_pat(d, p);
    }
    p += 5;
    
    z = z % (base(i));
  }
  int check = checkDigit(zip);

  if (check ==0)
    digit_pat_0(p);
  else
    digit_pat(check, p);
  p +=5;
  *p = '|';
  p++;
  *p = '\0';
  printf("%s\n", outString);
  return 0;
}

int base(int n) {
  int r = 1;
  for (int i=0; i < n; i++) {
    r *= 10;
  }
  return r;
}

void digit_pat(int a, char *c) {
  int weights[] = {7, 4, 2, 1};
  char last[] = {':', '|', '|', ':', '|', ':', ':', '|', ':', ':'};
  char *p = c;
  char orig_d = a;
  for (int i = 0; i<4 ; i++) {
    int d = a /  weights[i];
    if (d == 1) {
      *p = '|';
    }
    else {
      *p = ':';
    }
    p++;
    a = a % weights[i];
  }
  *p = last[orig_d];
}

void digit_pat_0(char *c) {
  char n0[] = "||:::";
  for (int i = 0; i<5; i++) {
    *c = n0[i];
    c++;
  }
}

int checkDigit(int z, char *c) {
  int s = 0;
  int d;
  for (int i = 4; i >= 0; i--) {
    d = z / base(i);
    s += d;
    z = z % (base(i));
  }
  return ((s/10+1)*10 - s);
}
