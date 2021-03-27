import sys


t, n, q = map(int, input().split())


def ask(x, y, z):
    global m
    t = tuple(sorted([x, y, z]))
    if t in m:
        return m[t]
    print(f'{x} {y} {z}')
    sys.stdout.flush()
    i = int(input())
    m[t] = i
    return i


for _ in range(t):
    global m
    m = {}
    order = [1, 2]
    for i in range(3, n+1):
        hi = len(order)-1
        lo = 0
        while True:
            if hi-lo < 9:
                median = ask(order[hi], order[lo], i)
                if median == order[hi]: 
                    order.insert(hi+1, i)
                    break
                elif median == order[lo]: 
                    order.insert(lo, i)
                    break
                elif hi == lo+1:
                    order.insert(hi, i)
                    break
                elif hi == lo+2:
                    lo += 1
                else:
                    hi -= 1
                    lo += 1
            else:
                mid1 = (2*lo + hi) // 3
                mid2 = (2*hi + lo) // 3
                # print(f'{mid1}, {mid2}', file=sys.stderr)
                median = ask(order[mid1], order[mid2], i)
                if median == order[mid1]:
                    hi = mid1
                    lo = lo
                elif median == order[mid2]:
                    lo = mid2
                    hi = hi
                else:
                    lo = mid1
                    hi = mid2
    print(' '.join(map(str, order)))
    sys.stdout.flush()
    input()
