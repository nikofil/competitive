$x = 0
$y = 0

def get
    yy = $y.abs - $x.abs
    $x.abs + yy.abs/2
end

puts gets.strip.split(',').map{|s|
    [s[0],s[-1]].each{|ch|
        case ch
        when "n"
            $y+=1
        when "s"
            $y-=1
        when "e"
            $x+=1
        when "w"
            $x-=1
        end
    }
    get()
}.max
