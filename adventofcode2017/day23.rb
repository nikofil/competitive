require 'prime'

b = 109900
c = 126900
puts b.step(c, 17).select{|x| !Prime.prime? x}.length
