def swp(r, i, j)
    r[i], r[j] = [r[j], r[i]]
    r
end

puts gets.strip.split(',').reduce(('a'..'p').to_a.join){|r, x|
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
