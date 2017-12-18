cnt = 0
h1 = Hash.new{|x,y| x[y] = 0}
h1['p'] = 0
h2 = Hash.new{|x,y| x[y] = 0}
h2['p'] = 1

def acc(h, v)
    if v.class == Integer
        v
    else
        h[v]
    end
end

ins = STDIN.read.split("\n")
c1 = 0
c2 = 0
q1 = []
q2 = []
lk1 = lk2 = false
loop do
    c = c1
    h = h1
    insn = ins[c]
    if insn
        x = insn.split.map{|x| if x.to_i.to_s == x then x.to_i else x end}
        case x[0]
        when 'snd'
            q2.push(acc(h, x[1]))
        when 'set'
            h[x[1]] = acc(h, x[2])
        when 'add'
            h[x[1]] += acc(h, x[2])
        when 'mul'
            h[x[1]] *= acc(h, x[2])
        when 'mod'
            h[x[1]] = h[x[1]] % acc(h, x[2])
        when 'rcv'
            lk1 = false
            h[x[1]] = q1.shift
            if not h[x[1]]
                c -= 1
                lk1=true
            end
        when 'jgz'
            c += acc(h, x[2]) - 1 if acc(h, x[1]) > 0
        end
        c += 1
        c1 = c
    end


    c = c2
    h = h2
    insn = ins[c]
    if insn
        x = insn.split.map{|x| if x.to_i.to_s == x then x.to_i else x end}
        case x[0]
        when 'snd'
            q1.push(acc(h, x[1]))
            cnt+=1
        when 'set'
            h[x[1]] = acc(h, x[2])
        when 'add'
            h[x[1]] += acc(h, x[2])
        when 'mul'
            h[x[1]] *= acc(h, x[2])
        when 'mod'
            h[x[1]] = h[x[1]] % acc(h, x[2])
        when 'rcv'
            lk2 = false
            h[x[1]] = q2.shift
            if not h[x[1]]
                c -= 1
                lk2=true
            end
        when 'jgz'
            c += acc(h, x[2]) - 1 if acc(h, x[1]) > 0
        end
        c += 1
        c2 = c
    end

    break if (lk1 and lk2) or not (ins[c1] or ins[c2])
end
puts lk1 and lk2
puts cnt
