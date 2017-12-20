t = 10000000
puts STDIN.read.split("\n").each_with_index.map{|inp,idx|
    p,v,a = inp.scan(/<[^>]*>/).map{|x| x[1...-1].split(',').map(&:strip).map(&:to_i)}
    #puts "#{p} #{v} #{a}"
    [3.times.reduce(0){|acc,i|
        acc + (p[i] + v[i]*t + a[i]*t*(t+1)/2).abs
    }, idx]
}.min{|x,y| x[0] <=> y[0]}
