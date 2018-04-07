def rate(x)
    d = 1
    r = 0
    x.split('').each{|y|
        if y == 'S'
            r += d
        else
            d*=2
        end
    }
    r
end

gets.to_i.times{|cc|
    inp = gets.split
    hp = inp[0].to_i
    s = inp[1].strip
    res = 'IMPOSSIBLE'
    steps = 0
    s = s[0...-1] while s[-1] == 'C'
    while rate(s) > hp do
        steps+=1
        ix = s.rindex 'C'
        break if ix == nil
        s[ix] = 'S'
        s[ix+1] = 'C'
        s = s[0...-1] if s[-1] == 'C'
    end
    if rate(s) <= hp then
        res = steps.to_s
    end
    puts "Case #%d: %s" % [cc+1, res]
}
