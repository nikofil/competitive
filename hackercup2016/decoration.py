cases = int(raw_input())

ja = [0]*100001
ji = [0]*100001
change1 = [0]*100001
change2 = [0]*100001

for icase in xrange(cases):    
    n = int(raw_input())
    ffrom = raw_input()
    to = raw_input()

    if ffrom[-1] == to[-1]: 
        change1[0] = 1
        ji[0] = 0
    else:
        change1[0] = 1
        ji[0] = 1

    i = 2
    painting = '~'
    while i <= n:
        if to[-i] == to[-i+1]:
            change1[i-1] = change1[i-2]
        else:
            change1[i-1] = change1[i-2]+1
        if ffrom[-i] == to[-i]:
            ji[i-1] = ji[i-2]
        else:
            painting = to[-i]
            ji[i-1] = change1[i-1]
        i += 1

    ffrom = ffrom[::-1]
    to = to[::-1]

    if ffrom[-1] == to[-1]: 
        change2[0] = 1
        ja[0] = 0
    else:
        change2[0] = 1
        ja[0] = 1

    i = 2
    painting = '~'
    while i <= n:
        if to[-i] == to[-i+1]:
            change2[i-1] = change2[i-2]
        else:
            change2[i-1] = change2[i-2]+1
        if ffrom[-i] == to[-i]:
            ja[i-1] = ja[i-2]
        else:
            painting = to[-i]
            ja[i-1] = change2[i-1]
        i += 1

    if n == 1:
        if ffrom[0] == to[0]:
            res = 0
        else:
            res = 1
    else:        
        res = 9999999999999
        ji2 = (ji[:n])[::-1]
        for i in xrange(n-1):
            mm = max([ja[i], ji2[i+1]])
            if mm < res:
                res = mm


    print ("Case #"+str(icase+1)+":"), res#, ji2, ja[:n]