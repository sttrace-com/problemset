int max_in_array(int *arr, int n) {
    if (n <= 0) return 0;
    int max = arr[0];
    for (int i = 1; i < n; i++) {
        if (arr[i] > max) max = arr[i];
    }
    return max;
}

double average(int *arr, int n) {
    if (n <= 0) return 0.0;
    long sum = 0;
    for (int i = 0; i < n; i++) sum += arr[i];
    return (double)sum / n;
}
