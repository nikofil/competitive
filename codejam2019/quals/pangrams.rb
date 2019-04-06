gets.to_i.times {|cc|
    gets
    x = gets.split.map(&:to_i)
    idx = x.index.with_index {|xx, i| xx != x[i+1]}
    sn = x[idx].gcd(x[idx+1])
    x[0..idx].reverse.each{|xx| sn = xx/sn}
    s = sn
    f = [sn] + x.map{|xx|
        s = xx/s
        s
    }
    fo = f.sort.uniq
    ss = f.map{|i| ('A'.ord + fo.index(i)).chr}.join
    puts "Case ##{cc+1}: #{ss}"
}
