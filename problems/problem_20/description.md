You are given multiple C source files: `main.c`, `palindrome.c`, `factorial.c`, and `array_utils.c`.  
Your task is to compile these files into a single binary named `final`.

### Example Usage
```example
$ ./final
Enter a word: level
Enter a number for factorial: 5
Enter size of array: 5
Enter 5 integers: 3 9 1 7 4
Is level a palindrome? 1
Factorial of 5: 120
Max in array: 9
Average of array: 4.80
```

### Acceptance Criteria
- The final binary should be named `final`.
- The binary must be present in the `/home/ubuntu` directory.
- The binary must be created by linking multiple object files (`main.o`, `palindrome.o`, `factorial.o`, `array_utils.o`).
- Only `gcc` or equivalent system compilers should be used to build the binary.

### Note
- You have `sudo` rights to install packages, e.g., `sudo apt install vim`.
- Compiled binary will be evaluated against multiple test cases.