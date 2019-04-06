gets.to_i.times {|cc|
    res2 = '0' * 1000
    res = gets.strip.chars.reverse.map.with_index{|x,i|
        if x == '4' then
            res2[-1-i] = '1'
            '3'
        else
            x
        end
    }.reverse.join
    puts "Case ##{cc+1}: #{res} #{res2.to_i}"
}
