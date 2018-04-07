require 'matrix'

def getar(x)
    Math.cos(Math::PI * x) + Math.sin(Math::PI * x)
end

gets.to_i.times{|cc|
    t = gets.to_f
    lo = 0
    hi = 0.25
    x = 0
    loop do
        x = (hi + lo)/2
        #puts "Area is %f for %f" % [getar(x), x]
        break if (getar(x) - t).abs < 0.00000001
        if getar(x) > t then
            hi = x
        else
            lo = x
        end
    end
    puts "Case #%d:" % [cc+1]
    x = x * Math::PI
    m = Matrix[ [0,0,0.5],[0,0.5,0],[0.5,0,0] ] * Matrix[[1,0,0],[0,Math.cos(x),-Math.sin(x)],[0,Math.sin(x),Math.cos(x)]]
    (0..2).each{|c|
        puts m.row(c).to_a.reverse.join ' '
    }
}
