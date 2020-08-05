include<stdio.h>
#include <stdbool.h>

int main() {
  bool occupied[] = {false, false, false, false, false, false, false, false, true, true, false, false, false, false, false, false, false};
  int booths = 17;

  printBooth(occupied, booths);
  
  int position = next_visitor(occupied, booths);
  occupied[position] = true;

  printBooth(occupied, booths);
  
  return 0;
}

int next_visitor(bool occupied[], int booths) {
  int max_length = 0;
  int length = 0;
  int first_i = 0;
  int max_first_i = 0;

  for (int i=0; i<booths; i++) {
    if (occupied[i] == false) {
      length += 1;
    }
    else {
      if (length > max_length) {
	max_length = length;
	max_first_i = first_i;
      }
      length = 0;
      first_i = i+1;
    }
  }

  if (length > max_length) {
    max_length = length;
    max_first_i = first_i;
  }

  return (max_length / 2 + max_first_i);
  
}

void printBooth(bool occupied[], int booths) {
  for (int i = 0; i<booths; i++) {
    if (occupied[i]) {
      printf("X");
    }
    else {
      printf("_");
    }
  }
  printf("\n");
}
