/*
 * 2017-09-29: Bob Plantz
 */

#include <unistd.h>

int main(void)
{
  char aLetter[200];
  char *p = &aLetter;

  write(STDOUT_FILENO, "Enter one character: ", 21); // prompt user

  read(STDIN_FILENO, p, 1);
  while(*p != '\n') {
    read(STDIN_FILENO, ++p, 1);                   // one character
  }
  *(++p) = '\0';
  
#include <unistd.h>

int main(void)
{
  char aLetter[200];
  char *p = &aLetter;

  write(STDOUT_FILENO, "Enter one character: ", 21); // prompt user                                                                                                                                                       

  read(STDIN_FILENO, p, 1);
  while(*p != '\n') {
    read(STDIN_FILENO, ++p, 1);                   // one character                                                                                                                                                        
  }
  *(++p) = '\0';

  write(STDOUT_FILENO, "You entered: ", 13);         // message                                                                                                                                                           
  printf("%s", aLetter);

  return 0;
}

  write(STDOUT_FILENO, "You entered: ", 13);         // message
  printf("%s", aLetter);
      
  return 0;
}
