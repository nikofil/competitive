cura = 591
curb = 393

puts 40000000.times.select{
    cura = (cura*16807) % 2147483647
    curb = (curb*48271) % 2147483647
    cura & ((1<<16) - 1) == curb & ((1<<16) - 1)
}.length
