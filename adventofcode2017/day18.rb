lastsnd = 0
h = Hash.new{|x,y| x[y] = 0}
def acc(h, v)
    if v.class == Integer
        v
    else
        h[v]
    end
end

ins = STDIN.read.split("\n")
c = 0
loop do
    insn = ins[c]
    break if not insn
    x = insn.split.map{|x| if x.to_i.to_s == x then x.to_i else x end}
    case x[0]
    when 'snd'
        lastsnd = acc(h, x[1])
    when 'set'
        h[x[1]] = acc(h, x[2])
    when 'add'
        h[x[1]] += acc(h, x[2])
    when 'mul'
        h[x[1]] *= acc(h, x[2])
    when 'mod'
        h[x[1]] = h[x[1]] % acc(h, x[2])
    when 'rcv'
        break if acc(h, x[1]) > 0
    when 'jgz'
        c += acc(h, x[2]) - 1 if acc(h, x[1]) > 0
    end
    c += 1
end
puts lastsnd
