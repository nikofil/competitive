#!/usr/bin/python
cases=int(raw_input())
for ccc in xrange(cases):
    print "Case #{0}:".format(ccc+1),
    n = int(raw_input())
    nn = n
    i = 2
    r = 0
    moves = set([])
    while i*i <= n:
        if n%i == 0:
            moves.add(i)
            r += 1
            n /= i
            while n%i == 0:
                n/=i
        i += 1
    if n > 1:
        moves.add(n)

    def isG(s):
        n = sum(map(int,list(str(s))))
        if n == 1 or n == 2 or n == 3: return True
        if n < 2 or n%2 == 0: return False
        if n < 9: return True
        if n%3 == 0: return False
        r = n
        f = 5
        while f*f <= r:
            if n%f == 0: return False
            if n%(f+2) == 0: return False
            f +=6
        return True   

    def wins(n, moves):
        if isG(n):
            return False
        # if len(moves) == 0:
            # raise Exception("no moves for " + str(n) + " " + str(nn))
        for m in moves:
            n2 = n
            moves2 = moves.copy()
            moves2.remove(m)
            if n2%m != 0:
                raise Exception("WOT")
            while n2%m == 0:
                n2 /= m
            if wins(n2, moves2) == False:
                return True
        return False

    print ["Seymour","Laurence"][wins(nn, moves)]