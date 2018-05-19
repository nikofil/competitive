gets.to_i.times{|cc|
    col = gets.to_i
    x = gets.split.map(&:to_i)
    if x[0] == 0 or x[-1] == 0 then
        puts "Case ##{cc+1}: IMPOSSIBLE"
    else
        rows = x.max
        res = Array.new(rows){'.'*col}
        col.times{|i|
            idx = x.index{|y| y>0}
            x[idx] -= 1
            cr = 0
            while i < idx do
                res[cr][i] = '\\'
                cr += 1
                i += 1
            end
            while i > idx do
                res[cr][i] = '/'
                cr += 1
                i -= 1
            end
        }
        puts "Case ##{cc+1}: #{rows}"
        puts res.join "\n"
    end
}
