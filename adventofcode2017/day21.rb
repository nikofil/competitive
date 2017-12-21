h = STDIN.read.split("\n").map{|x|
    x.split(" => ")
}.to_h


def s2boxes(s)
    ss = s.split('/')
    if ss.length == 4
        fuckingjoin([[ss[0][0..1], ss[1][0..1]], [ss[0][2..3], ss[1][2..3]], [ss[2][0..1], ss[3][0..1]], [ss[2][2..3], ss[3][2..3]]].map{|x| x.join('/')})
    else
        s
    end
end

def flip(s)
    s.split("/").map(&:reverse).join("/")
end

def rot(s)
    x = s.split('/')
    l = x.length
    (0...l).map{|i|
        (0...l).map{|j|
            x[l-1-j][i]
        }.join
    }.join '/'
end

def fuckingjoin(x)
    side = x[0].split('/')[0].length
    sidesmol = Math.sqrt(x.length).to_i
    side2 = sidesmol * side
    res = (0...side2).map{|i|
        (0...side2).map{|j|
            x[(i/side)*sidesmol + j/side].split('/')[i%side][j%side]
        }.join
    }.join '/'
    res
end

def fuckingsplit(x)
    y = x.split '/'
    sp = if y.length % 2 == 0; 2 else 3 end
    res = 0.step(y.length-1, sp).map{|k|
        0.step(y.length-1, sp).map{|l|
            (0...sp).map{|i|
                (0...sp).map{|j| y[k+i][l+j]}.join
            }.join '/'
        }
    }.flatten
    res
end

boxes = '.#./..#/###'

18.times{
    boxes = fuckingjoin(fuckingsplit(boxes).map{|x|
        n = 3.times.reduce([x]){|acc|
            acc + [rot(acc[-1])]
        }.map{|x| [x, flip(x)]}.flatten
        n.map!{|x| h[x]}.select!(&:itself)
        puts "wtf" if n[1..-1].any?{|x| x != n[0]}
        s2boxes(n[0])
    })
}

puts "#{boxes.count '#'}"
