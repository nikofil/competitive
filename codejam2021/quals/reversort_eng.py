def swap(x, i, j):
    til = i-1
    if til == -1:
        til = None
    return x[:i] + x[j:til:-1] + x[j+1:]

for c in range(int(input())):
    n, t = map(int, input().split())
    mx = 0
    for i in range(2, n+1):
        mx += i
    if t < n-1 or t > mx:
        r = 'IMPOSSIBLE'
    else:
        x = list(range(1, n+1))
        t -= n-1
        for i in reversed(range(n)):
            if t == 0:
                break
            swaps = min(t, n-i-1)
            x = swap(x, i, i+swaps)
            t -= swaps
        r = ' '.join(map(str, x))
    print(f'Case #{c+1}: {r}')
