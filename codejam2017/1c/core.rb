gets.to_i.times{|cur|
    n, k = gets.split.map(&:to_f)
    p = gets.to_f
    pts = gets.split.map(&:to_f).sort.reverse
    impr = pts[0...k]
    while p > 0 do
        u = impr.uniq
        if u.length == 1 then
            all = p / impr.length
            impr = [[impr[0] + all, 1.0].min] * impr.length
            p = 0
        else
            tospend = [(u[1] - u[0]) * impr.count(u[0]), p].min
            (0...impr.count(u[0])).each{|x|
                impr[x] += tospend / impr.count(u[0])
                impr[x] = [impr[x], 1.0].min
            }
            p -= tospend
            impr.sort!
        end
    end
    pts = impr + pts[k..-1]
    impr = 1.0 - pts.combination(k).map{|x|
        1.0 - x.map.reduce(:*)
    }.reduce(:*)
    puts "Case ##{cur+1}: #{impr}"
}
