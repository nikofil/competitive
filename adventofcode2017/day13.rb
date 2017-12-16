inp = STDIN.read.split("\n")
puts 0.upto(1000000000000).each{|cnt|
    break cnt unless inp.any?{|l|
        a, b = l.split(': ').map(&:to_i)
        (cnt+a) % ((b-1)*2) == 0
    }
}
