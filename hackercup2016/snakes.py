cases = int(raw_input())

def binomial(n, r):
    p = 1    
    for i in xrange(1, min(r, n - r) + 1):
        p *= n
        p //= i
        n -= 1
    return p

#probs = [[0]*3000 for i in xrange(3000)]

from sortedcontainers import SortedDict

m = SortedDict({})
res = 0

def clean(lt):
    global res
    global m
    tod = set([])
    for i in m:
        if i < lt:
            (ii, j, k) = m[i]
            res += j*(k-1)
            tod.add(i)
        else:
            break
    for i in tod:
        del m[i]

for icase in xrange(cases):    
    res = 0
    m = SortedDict({})
    n = int(raw_input())
    inp = []
    for i in xrange(n):
        i,j = map(int, raw_input().split())
        inp.append((i,j))
    inp.sort(key = lambda (x,y): x)
    for i in inp:
        (x,y) = i
        clean(y)
        if y in m:
            (i, j, k) = m[y]
            res += x*i
            m[y] = (i-2*x, x*x + j, k+1)
        else:
            m[y] = (-2*x, x*x, 1)
    clean(1000000000000)
    print ("Case #"+str(icase+1)+":"), (res % 1000000007)