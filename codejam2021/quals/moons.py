for c in range(int(input())):
    cj, jc, x = input().split(' ')
    cj = int(cj)
    jc = int(jc)
    x = x.replace('?', '')
    r = cj * x.count('CJ') + jc * x.count('JC')
    print(f'Case #{c+1}: {r}')
