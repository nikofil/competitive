cura = 591
curb = 393

puts 5000000.times.select{
    loop do
        cura = (cura*16807) % 2147483647
        break if cura & 0b11 == 0
    end
    loop do
        curb = (curb*48271) % 2147483647
        break if curb & 0b111 == 0
    end
    cura & ((1<<16) - 1) == curb & ((1<<16) - 1)
}.length
