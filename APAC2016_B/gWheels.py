#!/usr/bin/python
cases=int(raw_input())
for ccc in xrange(cases):
    rrr = raw_input()
    while rrr == '':
        rrr = raw_input()
    pedaln, extran, tiren = map(int, rrr.split())
    ped = map(int, raw_input().split())
    ext = map(int, raw_input().split())
    tire = map(int, raw_input().split())
    a1 = set([])
    m1 = {}
    a2 = set([])
    m2 = {}
    for i in ped:
        for j in ext:
            a1.add(i*j)
            if i*j in m1:
                m1[i*j].add(j)
            else:
                m1[i*j] = set([j])
    for i in tire:
        for j in ext:
            a2.add(i*j)
            if i*j in m2:
                m2[i*j].add(j)
            else:
                m2[i*j] = set([j])
    qs = int(raw_input())
    print "Case #{0}:".format(ccc+1)
    for q in range(qs):
        p,q = map(int, raw_input().split())
        
        def ex():
            for z in a1:
                if ((z*q) % p) ==0 and (z*q)/p in a2 and m1[z] != m2[(z*q)/p]:
                    return True
            return False
        
        print ["No","Yes"][ex()]