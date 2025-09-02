#include <stdio.h>
#include <string.h>

int is_palindrome(const char *s);
long factorial(int n);
int max_in_array(int *arr, int n);
double average(int *arr, int n);

int main() {
    char word[100];
    int n;
    int size;
    int nums[100];

    fprintf(stderr, "Enter a word: ");
    scanf("%99s", word);

    fprintf(stderr, "Enter a number for factorial: ");
    scanf("%d", &n);

    fprintf(stderr, "Enter size of array: ");
    scanf("%d", &size);

    fprintf(stderr, "Enter %d integers: ", size);
    for (int i = 0; i < size; i++) {
        scanf("%d", &nums[i]);
    }

    printf("Is %s a palindrome? %d\n", word, is_palindrome(word));
    printf("Factorial of %d: %ld\n", n, factorial(n));
    printf("Max in array: %d\n", max_in_array(nums, size));
    printf("Average of array: %.2f\n", average(nums, size));

    return 0;
}
