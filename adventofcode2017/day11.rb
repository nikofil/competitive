x = 0
y = 0

gets.strip.split(',').each{|s|
    [s[0],s[-1]].each{|ch|
        case ch
        when "n"
            y+=1
        when "s"
            y-=1
        when "e"
            x+=1
        when "w"
            x-=1
        end
    }
}

puts x,y
y = y.abs - x.abs
puts x.abs + y.abs/2
