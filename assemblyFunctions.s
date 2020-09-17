/*
 * AFunctions.s
 *
 * 
 */

  .global convertUpper
    .data
    // declare any global variables here

   .text
    convertUpper:     //taken from homework template
    mov   r12,r13		// save stack pointer into register r12
    sub   sp,#32		// reserve 32 bytes of space for local variables 
    push  {lr}		// push link register onto stack -- make sure you pop it out before you return 

  

   // Your solution here
    //R0 = pointer to first char in string, R1 = counter, R2 = increment
    MOV R2, #0    //clear registers
    MOV R1, #0

    FOR:
      LDRB R2, [R0]      
      CMP R2, #0X0    //check if pointer points to end of string
      BEQ DONE

      CMP R2, #0X61   //check if char is an upper case
      BLT SKIP

      CMP R2, #0X7A
      BGT SKIP
                          //if here, char must be a lower case letter
      SUB R2, R2, #0X20     //sub by 32 to get upper case variant


    SKIP:
      STRB R2, [R0]       //put back value into address stored at r0
      ADD R1, R1, #16        //increment counter by 4, needed to return pointer back to original position
      ADD R0, R0, #0x1        //move pointer to next char
      B FOR              //repeat loop

    DONE:
      //total distance travelled since beginning of function is now stored in R1
      ADD R0, R0, R1      //r0 = r0 - offset, r0 now points back to beginning of string
    

    //taken from homework template
     pop {lr}			// pop link register from stack 
     mov sp,r12		// restore the stack pointer -- Please note stack pointer should be equal to the 
                                          // value it had when you entered the function .  
     mov pc,lr			// return from the function by copying link register into  program counter





 .global getLength
    .data
    // declare any global variables here
   .text
    getLength:       //taken from homework template
    mov   r12,r13		// save stack pointer into register r12
    sub   sp,#32		// reserve 32 bytes of space for local variables 
    push  {lr}		// push link register onto stack -- make sure you pop it out before you return 

  

   // Your solution here
    //R0 = pointer, R1 = dereferencer, R2 = for counter

    MOV R1, #0    //clear registers
    MOV R2, #0    

    FOR1:
      LDRB R1, [R0]    //dereference r0
      CMP R1, #0X0     //check if it is equal to nullbyte
      BEQ DONE1       //exit loop

      ADD R2, R2, #1    //increment counter
      ADD R0, R0, #0X1  //move to next char in array
      B FOR1        //repeat loop

    DONE1:
      MOV R0, R2    //return counter


    pop {lr}			// pop link register from stack 
    mov sp,r12                  // restore the stack pointer -- Please note stack pointer should be equal to the 
                                // value it had when you entered the function .  
    mov pc,lr			// return from the function by copying link register into  program counter


 .global repeatKey
    .data
    // declare any global variables here
   .text
    repeatKey:
    mov   r12,r13		// save stack pointer into register r12
    sub   sp,#32		// reserve 32 bytes of space for local variables 
    push  {lr}		// push link register onto stack -- make sure you pop it out before you return 

  

   // Your solution here
   //R0 = string pointer, R1 = userLength, R2 = keyLength, R3 = dummy, R4 = endPointer, R5 = DUMMY2, R6 = dereferencer

   MOV R3, #0     //clear registers
   MOV R4, #0
   MOV R5, #0
   MOV R6, #0
   MOV R7, #0

   CMP R1, R2     //analyze lengths
   BEQ DONE2      //if they are the same, do nothing
   BLT REDUCE     //if userLength is less than keyLength, reduce key string
   
   EXTEND:        //if here, userlength is more than keylength
    SUB R3, R1, R2   ///R3 = userLength - keyLength
    MOV R4, R0    //copy address of beginner pointer into r4
    MOV R7, #0X1    
    MUL R5, R2, R7    //calculate offset (distance between beginning of string to the end), kinda redundant oops

    ADD R4, R4, R5    // R4 now points to the end of the string
    FOR2:
      CMP R3, #0      //check if userlength is now 0
      BEQ ENDFOR2       //exit loop

      LDRB R6, [R0]    
      STRB R6, [R4]   
      SUB R3, R3, #1    //decrement counter by 1
      ADD R0, R0, #0X1  //increment both pointers to next char
      ADD R4, R4, #0X1
      B FOR2
    
    ENDFOR2:
      MOV R6, #0X0      //reuse dummy register
      STRB R6, [R4]     //add nullbyte into end of string
      B DONE2
    
    REDUCE:           //if here, userLength is less than keyLength
      SUB R3, R2, R1   //r3 = keyLength - userLength
      MOV R7, #0X1
      MUL R4, R2, R7    //calculate offset (distance between beginning of string to the end), also redundant

      ADD R0, R0, R4      //move pointer to end of string
      
      MOV R5, #0X0          //move nullbyte into r5
      SUB R0, R0, #0X1      //r0 points to char before nullbyte

      FOR3:
        CMP R3, #0    //check if r3 is 0
        BEQ DONE2   //exit loop

        STRB R5, [R0]   //move null byte character into address stored in r0 (end of string)
        SUB R0, #0X1      //decrement R0 to point to previous char
        SUB R3, #1      //decrement counter

        B FOR3        //repeat
       
      DONE2:
        MOV R0, #0    //return void
  
     //taken from homework template
    pop {lr}			// pop link register from stack 
    mov sp,r12		// restore the stack pointer -- Please note stack pointer should be equal to the 
                                         // value it had when you entered the function .  
    mov pc,lr			// return from the function by copying link register into  program counter


 .global vigenereEncrypt
    .data
    // declare any global variables here
   .text
    vigenereEncrypt:     //taken from homework template
    mov   r12,r13		// save stack pointer into register r12
    sub   sp,#32		// reserve 32 bytes of space for local variables 
    push  {lr}		// push link register onto stack -- make sure you pop it out before you return 

   // Your solution here
    //R0 = plaintext pointer, R1 = keytext pointer, R2 = plaintext dereferencer, R3 = keytext dereferencer, R4 = modulo, R5 = lengthcounter, R6 = 0X1
    MOV R2, #0      //clear registers
    MOV R3, #0
    MOV R4, #0
    MOV R5, #0
    MOV R6, #0

    MASTERLOOP:
      LDRB R2, [R0]   //ldrb needed because we only want one char at a time
      LDRB R3, [R1]   //do the same for keytext
      CMP R2, #0    //is it null-byte (end of string?)
      BEQ FINISH    //if so, end loop
      
      SUB R2, R2, #0X41       //normalize ascii values...A=0, B=1, etc...
      SUB R3, R3, #0X41
      ADD R4, R2, R3    //(plaintext + keytext)
      MODULO26:         //assembly doesn't do real division, so we take this approach to calculate the modulo of 26
        CMP R4, #26       //is the number greater than 26?
        BLT ENDMODULO26
  
        SUB R4, R4, #26   //if not, subtract 26
        B MODULO26        //result will be modulo (even though we didn't divide or multiply anything)
      
      //R4 = (plaintext + keytext)mod26 = encrypted letter
      ENDMODULO26:
        ADD R4, R4, #0X41     //convert back to ascii
        STRB R4, [R0]      //store encrypted letter into plaintext string
        ADD R0, R0, #0X1      //move onto next char in string
        ADD R1, R1, #0X1      //same here
        ADD R5, R5, #1        //increment counter by 1
    B MASTERLOOP

   FINISH:
      //need to revert pointer back to beginning of string
      ADD R0, R0, #0X1    //move pointer forward
      ADD R1, R1, #0X1    //
      MOV R6, #0          //null byte
      STR R6, [R0]        //put terminating null byte
      STR R6, [R1]        //
      MOV R6, #0X1        //constant byte holder
      ADD R5, R5, #1      //since we are one byte ahead from previous steps
      MUL R5, R5, R6      //total distance travelled, redundant
      SUB R0, R0, R5
      SUB R1, R1, R5      //go back to beginning of string


       //taken from homework template
    pop {lr}			// pop link register from stack 
    mov sp,r12		// restore the stack pointer -- Please note stack pointer should be equal to the 
                                         // value it had when you entered the function .  
    mov pc,lr			// return from the function by copying link register into  program counter


  .global vigenereDecrypt
    .data
    // declare any global variables here
   .text
    vigenereDecrypt:         //taken from homework template
    mov   r12,r13		// save stack pointer into register r12
    sub   sp,#32		// reserve 32 bytes of space for local variables 
    push  {lr}		// push link register onto stack -- make sure you pop it out before you return 

   // Your solution here
    //R0 = plaintext pointer, R1 = keytext pointer, R2 = plaintext dereferencer, R3 = keytext dereferencer, R4 = modulo, R5 = lengthcounter, R6 = 0X1
    MOV R2, #0      //clear registers
    MOV R3, #0
    MOV R4, #0
    MOV R5, #0
    MOV R6, #0

    MASTERLOOPD:
      LDRB R2, [R0]   //need to ldrb because we only want to work with one char at a time
      LDRB R3, [R1]   //same for keytext
      CMP R2, #0    //is it null-byte (end of string?)
      BEQ FINISH2    //if so, end loop
      
      SUB R2, R2, #0X41       //normalize ascii values...A=0, B=1, etc...
      SUB R3, R3, #0X41
      SUB R4, R2, R3    //(plaintext + keytext)

      MODULO26D:        //can use the same algorithm as before, but since we are subtracting, we need to account for the possibility of a negative value
        CMP R4, #0        //negative check, if it comes out to be negative we loop it back around from Z towards A
        ADDLT R4, #26  
        BLT MODULO26D   //repeat as necessary

        CMP R4, #26       //same as before
        BLT ENDMODULO26D
  
        SUB R4, R4, #26  
        B MODULO26D       
      
      //R4 = (plaintext + keytext)mod26 = encrypted letter
      ENDMODULO26D:
        ADD R4, R4, #0X41     //normalize back to ascii
        STRB R4, [R0]      //store encrypted letter into plaintext string, need strb because we don't want to overwrite more than one char at a time
        ADD R0, R0, #0X1      //move onto next char in string
        ADD R1, R1, #0X1      //same here
        ADD R5, R5, #1        //increment counter by 1
    B MASTERLOOPD

   FINISH2:
      //need to revert pointer back to beginning of string, also put null byte at end of string
      ADD R0, R0, #0X1    //move pointer forward
      ADD R1, R1, #0X1    //
      MOV R6, #0          //null byte
      STR R6, [R0]        //put terminating null byte
      STR R6, [R1]        //
      MOV R6, #0X1        //constant byte holder
      ADD R5, R5, #1      //since we are one byte ahead from previous steps
      MUL R5, R5, R6      //total distance travelled
      SUB R0, R0, R5
      SUB R1, R1, R5      //go back to beginning of string

    //taken from homework template
    pop {lr}			// pop link register from stack 
    mov sp,r12		// restore the stack pointer -- Please note stack pointer should be equal to the 
                                         // value it had when you entered the function .  
    mov pc,lr			// return from the function by copying link register into  program counter
 
