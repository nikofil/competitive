s = gets.to_i

len = 1
p = 0
res = 0

50000000.times {|c|
     p = ((p + s) % len) + 1
     len += 1
     res = c+1 if p == 1
}

puts res
