for c in range(1, int(input())+1):
    input()
    x = list(map(int, input().split(' ')))
    s = list(sorted(x))
    idx_of = {val: idx for idx, val in enumerate(x)}
    r = 0
    for i in range(len(x)-1):
        swap_til = idx_of[s[i]]
        swap_from = i-1
        if swap_from == -1:
            swap_from = None
        x = x[:i] + x[swap_til:swap_from:-1] + x[swap_til+1:]
        for j in range(i, swap_til+1):
            idx_of[x[j]] = j
        r += swap_til-i+1
    print(f'Case #{c}: {r}')
