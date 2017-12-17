s = gets.to_i

a = [0]
p = 0

2017.times {|c|
     p = ((p + s) % a.length) + 1
     a.insert p, c + 1
}

puts a[a.index(2017)+1]
