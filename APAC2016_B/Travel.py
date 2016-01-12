cases=int(raw_input())
for ccc in xrange(cases):
    pedaln, extran, tiren = map(int, raw_input().split())
    ped = map(int, raw_input().split())
    ext = map(int, raw_input().split())
    tire = map(int, raw_input().split())
    qs = int(raw_input())
    print "Case #{0}:".format(ccc+1)
    for q in range(qs):
        p,q = map(int, raw_input().split())
    
    for cc in xrange(rn):
        d = map(lambda x: int(x) - 1, raw_input().split())
        costs = map(int, raw_input().split())
        roads.append((d, costs))
    visa = [set([0]) for _ in range(24)]
    besta = [[x] + [0]*(cn-1) for x in range(24)]
    for qq in xrange(qn):
        to, at = map(int, raw_input().split())
        to -= 1
        vis = visa[at]
        best = besta[at]
        while to not in vis:
            cb = 9999999999999
            ct = -1

            for r in roads:
                if r[0][0] in vis and r[0][1] not in vis and (best[r[0][0]] + r[1][best[r[0][0]]%24] < cb):
                    cb = best[r[0][0]] + r[1][best[r[0][0]]%24]
                    ct = r[0][1]
                elif r[0][1] in vis and r[0][0] not in vis and (best[r[0][1]] + r[1][best[r[0][1]]%24] < cb):
                    cb = best[r[0][1]] + r[1][best[r[0][1]]%24]
                    ct = r[0][0]

            if ct == -1:
                break

            vis.add(ct)
            best[ct] = cb
        if to in vis:
            print best[to]-best[0],
        else:
            print -1,
    print ""