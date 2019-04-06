gets.to_i.times {|cc|
    n,bb,ff=gets.split.map(&:to_i)
    b = [0]*(n-bb)
    ff.times {|f|
        puts (0...n).map{|i| (i & (1 << f)) >> f}.join
        STDOUT.flush
        gets.strip.chars.each.with_index {|x,i|
            b[i] += x.to_i << f
        }
    }
    puts (0...n).reject{|x| b.include? x}.join ' '
    STDOUT.flush
    gets
}
exit
