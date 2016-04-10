n = gets.to_i

n.times {|nn|
    k, c, s = gets.split.map(&:to_i)
    print "Case #%d: " % (nn + 1)
    if c*s < k then
        puts "IMPOSSIBLE"
        next
    end
    n = 0
    rezzes = []
    while n < k do
        res = n
        n += 1
        (c-1).times {
            res *= k
            res += n if n < k
            n += 1
        }
        rezzes << (res+1)
    end
    puts rezzes.uniq.join ' '
}
