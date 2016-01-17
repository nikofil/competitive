cases = int(raw_input())
for icase in xrange(cases):
    raw_input()
    v = map(int, raw_input().split())
    len = 1
    x = 0
    res = 0
    for i in v:
        if (x % 4) == 0:
            cur = i
            x += 1
            continue
        d = i-cur
        # print cur, i, d
        cur = i
        if d > 10:
            while (x % 4) != 0 and d > 10:
                d -= 10
                x += 1
                res += 1
        elif d <= 0:
            while (x % 4) != 0:
                x += 1
                res += 1
        x += 1
    while (x % 4) != 0:
        x += 1
        res += 1
    print "Case #{0}: {1}".format(icase+1, res)