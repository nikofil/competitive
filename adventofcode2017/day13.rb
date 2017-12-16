puts STDIN.read.split("\n").map{|l|
    a, b = l.split(': ').map(&:to_i)
    if a % ((b-1)*2) == 0 then
        puts a,b
        a*b
    else
        0
    end
}.sum
