#include <unistd.h>

int main(){
  int max_l = 200;
  char test[max_l];
  char *p = &test;
  
  readLn(&test, max_l);
  writeStr(&test);

  while(1==1) {
    readLn(&test, max_l);
    if(*p == '\n')
      break;
    writeStr(&test);
  }
  
  return 0;
}

void writeStr(char *out_str) {
  do {
    write(STDOUT_FILENO, out_str++, 1);
  }
  while(*out_str != '\n');
  write(STDOUT_FILENO, out_str, 1);
  
}

void readLn(char *c_arr, int max_l) {
  char *p = c_arr;
  read(STDIN_FILENO, c_arr, 1);
  while((p - c_arr) < max_l && *p != '\n') {
    read(STDIN_FILENO, ++p, 1);
  }
}
