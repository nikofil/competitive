import itertools

cases = int(raw_input())
for ccc in xrange(cases):
    n, k = map(int, raw_input().split())
    s = []
    for i in xrange(n):
        s.append(raw_input())
    d = [[0]*(n+1) for i in xrange(n+1)]
    for ii, i in enumerate(s):
        d[0][ii+1] = d[ii+1][0] = len(i)
        for jj, j in enumerate(s):
            m = min(len(i), len(j))
            com = 0
            while com < m and i[com] == j[com]:
                com += 1
            d[ii+1][jj+1] = d[jj+1][ii+1] = len(i) + len(j) - 2*com
    # print d
    if k == 1:
        res = 2*min(d[0][1:])
    else:
        S = [x+1 for x in range(n)]
        m = {}
        for i in S:
            m[(frozenset([i]), i)] = d[0][i]

        res = 99999999999999

        for i in xrange(2, k+1):
            for com in itertools.combinations(S, i):
                for z in com:
                    lol = 999999999999
                    without = frozenset(com).difference([z])
                    for q in without:
                        if m[(without, q)] + d[q][z] < lol:
                            lol = m[(without, q)] + d[q][z]
                    m[(frozenset(com), z)] = lol
                    if i == k and lol+d[0][z] < res:
                        res = lol+d[0][z]

    print "Case #{0}:".format(ccc+1), res+k