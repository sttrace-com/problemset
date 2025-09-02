long factorial(int n) {
    if (n < 0) return -1;
    long res = 1;
    for (int i = 2; i <= n; i++) res *= i;
    return res;
}
