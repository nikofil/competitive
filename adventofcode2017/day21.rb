h = STDIN.read.split("\n").map{|x|
    x.split(" => ")
}.to_h

puts "#{h}"

def s2boxes(s)
    ss = s.split('/')
    if ss.length == 4
        [[ss[0][0..1], ss[1][0..1]], [ss[2][0..1], ss[3][0..1]], [ss[0][2..3], ss[1][2..3]], [ss[2][2..3], ss[3][2..3]]].map{|x| x.join('/')}
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

boxes = ['.#./..#/###']

5.times{
    boxes.map!{|x|
        n = 3.times.reduce([x]){|acc|
            acc + [rot(acc[-1])]
        }.map{|x| [x, flip(x)]}.flatten
        n.map!{|x| h[x]}.select!(&:itself)
        puts "wtf" if n[1..-1].any?{|x| x != n[0]}
        s2boxes(n[0])
    }.flatten!
    #puts "#{boxes}"
}

puts "#{boxes.join.count '#'}"
