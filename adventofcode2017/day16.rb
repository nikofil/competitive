def swp(r, i, j)
    r[i], r[j] = [r[j], r[i]]
    r
end

inp = ('a'..'p').to_a.join 
steps = gets.strip.split(',')
s = {}
cur = 0
while cur < 1000000000
    if s.include? inp
        dif = cur-s[inp]
        cur += dif while cur + dif < 1000000000
    else
        s[inp] = cur
    end
    inp = steps.reduce(inp){|r, x|
        a, b = x[1..-1].split('/')
        case x[0]
        when 's'
            a = a.to_i
            r[-a..-1] + r[0...-a]
        when 'x'
            swp(r, a.to_i, b.to_i)
        when 'p'
            swp(r, r.index(a), r.index(b))
        else
            'wtfwtfwtfwtfwtfwtfwtfwtfwtfwtfwtfwtf'
        end
    }
    cur += 1
end
puts inp
