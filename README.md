# vigenere-encryption-decreyption-arm-assembly
Encrypts/decrypts a plaintext string of ASCII characters using a repeated keyphrase. Uses C and ARM Assembly.

## Compilation
Import into SEGGER Embedded Studio. GCC compiler + GNU linker required. Compiled object files can be found in Output folder.

## Instructions
1. Run the debugger (or run on target device).
2. When prompted in the console, enter the text to be decrypted/encrypted (no spaces).
3. When prompted in the console, enter the keyphrase to encrypt/decrypt the previous text.
4. Select whether to 1. Encrypt or 2. Decrypt
5. Encrypted/decrypted text will be displayed in the console.

See attached report (in PDF format) for detailed information on how this is implemented.
Note: Code in the report may be an older version of the code listed in this repository.

## License
MIT License

Copyright (c) [2020] [Ryan Yukio Shimizu]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
