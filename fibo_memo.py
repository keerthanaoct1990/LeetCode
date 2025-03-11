def fibo(n, memo={}):
    if n <= 1:
        return n;
    if n not in memo:
        memo[n] = fibo(n-1, memo) + fibo(n-2, memo);
    return memo[n]
print(fibo(10))