#include "assemblyFunctions.h"
#include <stdio.h>
#include <stdlib.h>

/*********************************************************************
*
*       main()
*
*  Function description
*   Application entry point.
*/
void main(void) {
  char userInput[200];
  char keyInput[200];
  char *user = &userInput[0];
  char *key = &keyInput[0];
  printf("Enter the phrase to be encrypted/decrypted (max 12 characters):\n");
  scanf("%50s", user);
  printf("\nEnter the keyword to be encrypted/decrypted (max 12 characters):\n");
  scanf("%50s", key);



  convertUpper(user);     //converts user input to uppercase, necessary prep for algorithm
  convertUpper(key);


  int userLength = getLength(user);     //used for proceeding function
  int keyLength = getLength(key);

  repeatKey(key, userLength, keyLength);    //repeats the key to match the length of the user input

  printf("\nEncrypt/Decrypt?\n1. Encrypt\n2. Decrypt\n");
  int option;
  scanf("%d",&option);
  switch(option){
    case 1:
        vigenereEncrypt(user, key);     //branch to encrypt
        printf("Encrypted Text: %s", user);
        break;
    case 2:
        vigenereDecrypt(user, key);     //branch to decrypt
        printf("Decrypted Text: %s", user);
        break;
    default:
        printf("\nInvalid Option.\n");
        break;
  }
}

/*************************** End of file ****************************/
