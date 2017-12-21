a = STDIN.read.split("\n").map{|inp|
    inp.scan(/<[^>]*>/).map{|x| x[1...-1].split(',').map(&:strip).map(&:to_i)}
}.each_with_index.to_a

res = 100000.times.reduce(a){|v|
    v.each{|x|
        3.times{|y|
            x[0][1][y] += x[0][2][y]
            x[0][0][y] += x[0][1][y]
        }
    }
    v.group_by{|x| x[0][0]}.select{|k,r| r.count==1}.map{|k,r| r[0]}
}

puts res.length
