gets.to_i.times{|cc|
    dst, hc = gets.split.map(&:to_i)
    wors = (0...hc).map{
        pos, sp = gets.split.map(&:to_i)
        (dst - pos) / (sp*1.0)
    }.max
    puts "Case #%d: %f" % [cc+1, dst/wors]
}
