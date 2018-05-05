gets.to_i.times{|cc|
    n = gets.to_i
    x = gets.split.map(&:to_i)
    m = [0]*(n+2)
    x.each_with_index{|y,i|
        x2 = 0
        x2 = i-400 if n > 500 and i > 401
        (i.downto x2).each{|ii|
            if (ii == 0 or m[ii] != 0) and y*6 >= m[ii] then
                nn = m[ii]+y
                if nn < m[ii+1] or m[ii+1]==0 then
                    m[ii+1] = nn
                end
            end
        }
    }
    res = m[1..-1].index(0)
    puts "Case ##{cc+1}: #{res}"
}
